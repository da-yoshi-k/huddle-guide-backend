# == Schema Information
#
# Table name: advancements
#
#  id               :bigint           not null, primary key
#  advancement_type :integer          default(0), not null
#  content          :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :uuid             not null
#  workshop_id      :uuid             not null
#
# Indexes
#
#  index_advancements_on_user_id      (user_id)
#  index_advancements_on_workshop_id  (workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workshop_id => workshops.id)
#
class Advancement < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :content, presence: true, length: { maximum: 20 }
  validates :content, uniqueness: { scope: %i[user_id workshop_id] }
end
