# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  avatar           :string
#  crypted_password :string
#  description      :text
#  email            :string           not null
#  login_type       :integer          default("default"), not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test+#{n}@example.com" }
    password { "password" }
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
