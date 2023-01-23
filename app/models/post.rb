# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  content     :string           not null
#  level       :integer          default(0)
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#
# Indexes
#
#  index_posts_on_content_and_user_id_and_workshop_id  (content,user_id,workshop_id) UNIQUE
#  index_posts_on_user_id                              (user_id)
#  index_posts_on_workshop_id                          (workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workshop_id => workshops.id)
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :content, presence: true, length: { maximum: 20 }
  validates :content, uniqueness: { scope: %i[user_id workshop_id] }
end
