FactoryBot.define do
  factory :member do
    role { 0 }
    association :user
    association :team
  end
end
