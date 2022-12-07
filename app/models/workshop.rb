class Workshop < ApplicationRecord
  has_many :participations
  has_many :messages
  has_many :posts

  belongs_to :team
  belongs_to :work
  belongs_to :work_step

  validates :participations, length: { maximum: 6 }
end
