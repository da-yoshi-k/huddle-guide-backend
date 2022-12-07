FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "チーム_#{n}" }
    description { "チームの説明です" }
  end
end
