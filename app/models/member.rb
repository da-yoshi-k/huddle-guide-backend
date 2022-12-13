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
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: { general: 0, admin: 1 }

  validates :user_id, uniqueness: { scope: :team_id }
  validates :role, presence: true
end
