FactoryBot.define do
  factory :book do
    title { "Practical Object-Oriented Design in Ruby: An Agile Primer" }
    description { "The Complete Guide to Writing More Maintainable, Manageable, Pleasing, and Powerful Ruby Applications"}
    user
  end
end
