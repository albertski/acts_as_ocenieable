module ActsAsOcenieable
  module Ocenieable

    def self.included(base)
      base.class_eval do
        has_many :ocenies, class_name: "ActsAsOcenieable::Ocenie", as: :rateable, dependent: :destroy do
          def raters
            includes(:rater).map(&:rater)
          end
        end
        accepts_nested_attributes_for :ocenies

        before_save :add_default_ocenie_values
      end

      private

      def build_ocenies_based_on_options
        self.acts_as_ocenieable_options[:rating_types].each do |rating_type_category, rating_types|
          rating_types.each do |rating_type|
            has_rating = false

            self.ocenies.each do |ocenie|
              has_rating = true if ocenie.has_category_and_type?(rating_type_category, rating_type)
            end

            self.ocenies.build rating_type_category: rating_type_category,
                                       rating_type: rating_type,
                                       max_rating: self.acts_as_ocenieable_options[:max_rating] if !has_rating
          end
        end
      end

      def remove_ocenies_not_in_options
        self.ocenies = self.ocenies.select do |current_ocenie|
          reject = false
          self.acts_as_ocenieable_options[:rating_types].each do |rating_type_category, rating_types|
            rating_types.each do |rating_type|
              reject = true if current_ocenie.has_category_and_type?(rating_type_category, rating_type)
            end
          end
          reject
        end
      end
    end

    def add_default_ocenie_values
      self.ocenies.each do |item|
        item.rater = self.user
      end
    end

    def build_ocenies
      build_ocenies_based_on_options
      remove_ocenies_not_in_options
      self.ocenies
    end
  end
end
