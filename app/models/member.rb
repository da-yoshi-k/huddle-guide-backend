class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum role: { general: 0, admin: 1 }

  validates :user_id, uniqueness: { scope: :team_id }
  validates :role, presence: true
end
