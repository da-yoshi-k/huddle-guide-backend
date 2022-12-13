# == Schema Information
#
# Table name: work_steps
#
#  id         :bigint           not null, primary key
#  work_id    :bigint           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class WorkStep < ApplicationRecord
  belongs_to :work

  validates :name, presence: true, length: { maximum: 255 }
end
