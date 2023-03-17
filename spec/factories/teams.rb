# == Schema Information
#
# Table name: teams
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "チーム_#{n}" }
    description { 'チームの説明です' }
  end
end
