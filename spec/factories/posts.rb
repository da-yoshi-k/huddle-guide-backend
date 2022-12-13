# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  content     :string           not null
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :post do
    user { nil }
    workshop { nil }
    content { "MyString" }
    type { "" }
  end
end
