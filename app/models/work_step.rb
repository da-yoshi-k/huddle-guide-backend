class WorkStep < ApplicationRecord
  belongs_to :work

  validates :name, presence: true, length: { maximum: 255 }
end
