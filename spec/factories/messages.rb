FactoryBot.define do
  factory :message do
    user { nil }
    workshop { nil }
    content { "MyString" }
  end
end
