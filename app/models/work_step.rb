# == Schema Information
#
# Table name: work_steps
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WorkStep < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
end
