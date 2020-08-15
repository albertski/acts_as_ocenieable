FactoryBot.define do
  factory :user do
    username { "Albert Jankowski" }
    email { "albertski@hey.com" }
    encrypted_password { "12345678" }
  end
end
