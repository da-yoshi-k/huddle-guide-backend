# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  content     :string           not null
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :content, presence: true, length: { maximum: 255 }
end
