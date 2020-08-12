module ActsAsOcenieable
  class Ocenie < ::ActiveRecord::Base
    if defined?(ProtectedAttributes)
      attr_accessible :rateable_id, :rateable_type, :rating, :max_rating,
                      :rater_id, :rater_type, :rating_type_category, :rating_type, :rater
    end

    belongs_to :rateable, polymorphic: true
    belongs_to :rater, polymorphic: true

    scope :for_type, ->(klass) { where(rateable_type: klass.to_s) }
    scope :by_type, ->(klass) { where(rater_type: klass.to_s) }

    def has_category_and_type?(rating_type_category, rating_type)
      self.rating_type.eql? rating_type and self.rating_type_category.to_sym.eql? rating_type_category
    end
  end
end
