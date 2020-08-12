module ActsAsOcenieable
  module Extenders
    module Ocenieable
      DEFAULT_MAX_RATING = 10.0

      def rateable?
        false
      end

      def acts_as_ocenieable(args = {})
        require "acts_as_ocenieable/ocenieable"
        include ActsAsOcenieable::Ocenieable

        define_method :acts_as_ocenieable_options do
          self.class.instance_variable_get("@acts_as_ocenieable_options")
        end

        class_eval do
          @acts_as_ocenieable_options = {
            max_rating: DEFAULT_MAX_RATING,
            rating_types: {
              overall: [
                'Overall',
              ]
            }
          }.merge(args)

          def self.rateable?
            true
          end
        end
      end
    end
  end
end
