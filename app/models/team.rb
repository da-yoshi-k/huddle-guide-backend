class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :name, presence: true, length: { maximum: 20 }
  validates :members, length: { maximum: 6 }
end
