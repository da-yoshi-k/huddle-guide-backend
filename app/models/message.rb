# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  content     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :content, presence: true, length: { maximum: 255 }
end
