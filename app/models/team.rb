# == Schema Information
#
# Table name: teams
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Team < ApplicationRecord
  has_many :members, -> { order(:id) }, dependent: :destroy
  has_many :users, through: :members

  validates :name, presence: true, length: { maximum: 20 }
  validates :members, length: { maximum: 6 }
end
