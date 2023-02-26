# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  role       :integer          default("general"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_members_on_team_id  (team_id)
#  index_members_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: { general: 0, admin: 1 }

  validates :user_id, uniqueness: { scope: :team_id }
  validates :role, presence: true
  validate :team_member_limit, on: :create

  def team_member_limit
    errors.add(:base, 'チームへの最大の参加人数を超えています') if team.members.size >= 8
  end
end
