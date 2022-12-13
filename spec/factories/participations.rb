# == Schema Information
#
# Table name: participations
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  is_active   :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :participation do
    user { nil }
    workshop { nil }
    is_active { false }
  end
end
