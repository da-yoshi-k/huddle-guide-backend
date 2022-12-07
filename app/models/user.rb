class User < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :teams, through: :members, source: :team

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
end
