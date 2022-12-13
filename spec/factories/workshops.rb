# == Schema Information
#
# Table name: workshops
#
#  id           :uuid             not null, primary key
#  team_id      :uuid             not null
#  work_id      :bigint           not null
#  work_step_id :bigint           not null
#  work_date    :datetime
#  facilitator  :string
#  presenter    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :workshop do
    team { nil }
    work { nil }
    work_step { nil }
    work_date { "2022-12-07 02:06:51" }
    facilitator { "MyString" }
    presenter { "MyString" }
  end
end
