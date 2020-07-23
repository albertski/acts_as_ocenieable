module ActsAsOcenieable
  class Ocenie < ::ActiveRecord::Base
    if defined?(ProtectedAttributes)
      attr_accessible :rateable_id, :rateable_type,
                      :rater_id, :rater_type, :rating_type
    end

    belongs_to :rateable, polymorphic: true
    belongs_to :rater, polymorphic: true

    scope :for_type, ->(klass) { where(rateable_type: klass.to_s) }
    scope :by_type, ->(klass) { where(rater_type: klass.to_s) }

    validates_presence_of :rateable_id
    validates_presence_of :rater_id
  end
end
