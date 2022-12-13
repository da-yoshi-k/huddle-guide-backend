# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  name             :string           not null
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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
