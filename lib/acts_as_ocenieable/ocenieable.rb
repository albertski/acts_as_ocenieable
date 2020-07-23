module ActsAsOcenieable
  module Ocenieable

    def self.included(base)
      base.class_eval do
        has_many :ocenies_for, class_name: "ActsAsOcenieable::Ocenie", as: :rateable, dependent: :destroy do
          def raters
            includes(:rater).map(&:rater)
          end
        end
      end
    end

    attr_accessor :ocenie_registered

    def ocenie_registered?
      return self.ocenie_registered
    end

    def rate_by(args = {})
      return false if args[:rater].nil?

      options = { rating: 1, type: ""}.merge(args)

      ocenies = find_ocenies_by(options[:rater], options[:type])

      if ocenies.empty?
        # This rater has never add rating.
        ocenie = ActsAsOcenieable::Ocenie.new(
          rateable: self,
          rater: options[:rater],
          rating_type: options[:type]
        )
      else
        # This rater is potentially changing their rating.
        ocenie = ocenies.last
      end

      last_update = ocenie.updated_at

      ocenie.weight = (options[:weight].to_i if options[:weight].present?) || 1

      ActiveRecord::Base.transaction do
        self.ocenie_registered = false
        return false unless ocenie.save

        self.ocenie_registered = true if last_update != ocenie.updated_at
        return true
      end
    end

    def find_ocenies_for(extra_conditions = {})
      ocenies_for.where(extra_conditions)
    end

    def find_ocenies_by(rater, type)
      find_ocenies_for(rater_id: rater.id,
                       rating_type: type,
                       rater_type: rater.class.base_class.name)
    end
  end
end
