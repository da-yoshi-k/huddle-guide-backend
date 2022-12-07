FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test+#{n}@example.com" }
    crypted_password { "password" }
    salt { "MyString" }
    sequence(:name) { |n| "ハドル#{n}タロウ" }
    description { "テストユーザーです" }

    trait :user_with_teams do
      after(:build) do |user|
        user.teams << create(:team)
        user.members.first.admin!
        user.save
      end
    end
  end
end
