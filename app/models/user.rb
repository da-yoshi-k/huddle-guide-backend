# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  avatar           :string
#  crypted_password :string
#  description      :text
#  email            :string           not null
#  login_type       :integer          default("default"), not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  include JwtToken
  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!
  has_many :members, dependent: :destroy
  has_many :teams, through: :members, source: :team
  has_many :posts
  has_many :advancements

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :password, length: { minimum: 8 }, if: -> { default? && (new_record? || changes[:crypted_password]) }
  validates :description, length: { maximum: 400 }

  enum login_type: { default: 0, google: 1 }
end
