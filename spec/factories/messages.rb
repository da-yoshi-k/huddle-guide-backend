# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  content     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :message do
    user { nil }
    workshop { nil }
    content { "MyString" }
  end
end
