FactoryBot.define do
  factory :post do
    user { nil }
    workshop { nil }
    content { "MyString" }
    type { "" }
  end
end
