class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :is_active, presence: true
end
