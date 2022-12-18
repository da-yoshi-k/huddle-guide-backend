# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  name             :string           not null
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :members, dependent: :destroy
  has_many :teams, through: :members, source: :team

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, length: { minimum: 8 }
end
