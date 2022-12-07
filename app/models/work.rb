class Work < ApplicationRecord
  has_many :work_steps

  validates :name, presence: true, length: { maximum: 255 }
end
