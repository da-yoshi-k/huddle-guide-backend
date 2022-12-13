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
class Workshop < ApplicationRecord
  has_many :participations
  has_many :messages
  has_many :posts

  belongs_to :team
  belongs_to :work
  belongs_to :work_step

  validates :participations, length: { maximum: 6 }
end
