FactoryBot.define do
  factory :user do
    email { "MyString" }
    crypted_password { "MyString" }
    salt { "MyString" }
    name { "MyString" }
    description { "MyText" }
  end
end
