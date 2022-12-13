# == Schema Information
#
# Table name: reactions
#
#  id            :bigint           not null, primary key
#  user_id       :uuid             not null
#  post_id       :bigint           not null
#  reaction_type :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :reaction do
    user { nil }
    post { nil }
    reaction_type { 1 }
  end
end
