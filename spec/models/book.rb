class Book < ActiveRecord::Base
  acts_as_ocenieable rating_types: [
    'Performance',
    'Story',
    'Overall'
  ]
end
