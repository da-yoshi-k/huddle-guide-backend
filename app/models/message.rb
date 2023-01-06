# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#
# Indexes
#
#  index_messages_on_user_id      (user_id)
#  index_messages_on_workshop_id  (workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workshop_id => workshops.id)
#
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :content, presence: true, length: { maximum: 255 }

  scope :recent, -> { order(:created_at) }
end
