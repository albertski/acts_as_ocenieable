module ActsAsOcenieable
  module Extenders
    module Ocenieable
      def rateable?
        false
      end

      def acts_as_ocenieable(args = {})
        require "acts_as_ocenieable/ocenieable"
        include ActsAsOcenieable::Ocenieable

        class_eval do
          def self.rateable?
            true
          end
        end
      end
    end
  end
end
