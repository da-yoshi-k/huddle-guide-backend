# == Schema Information
#
# Table name: participations
#
#  id          :bigint           not null, primary key
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#  is_active   :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :is_active, presence: true
end
