class Book < ActiveRecord::Base
  belongs_to :user
  acts_as_ocenieable rating_types: {
    science_fiction: [
     'Writing',
     'Plot',
     'Character',
     'World Building',
    ],
    non_fiction: [
      'Writing',
      'Plot',
    ],
  }
end
