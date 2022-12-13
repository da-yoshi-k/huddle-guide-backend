# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  role       :integer          default("general"), not null
#  user_id    :uuid             not null
#  team_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :member do
    role { 0 }
    association :user
    association :team
  end
end
