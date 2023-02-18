# == Schema Information
#
# Table name: workshops
#
#  id           :uuid             not null, primary key
#  facilitator  :string
#  presenter    :string
#  work_date    :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :uuid             not null
#  work_id      :bigint           not null
#  work_step_id :bigint           not null
#
# Indexes
#
#  index_workshops_on_team_id       (team_id)
#  index_workshops_on_work_id       (work_id)
#  index_workshops_on_work_step_id  (work_step_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (work_id => works.id)
#  fk_rails_...  (work_step_id => work_steps.id)
#
class Workshop < ApplicationRecord
  has_many :participations, -> { order(:id) }, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :posts, -> { order(:id) }, dependent: :destroy
  has_many :users, through: :participations

  belongs_to :team
  belongs_to :work
  belongs_to :work_step

  validates :participations, length: { maximum: 6 }
end
