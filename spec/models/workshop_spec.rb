# == Schema Information
#
# Table name: workshops
#
#  id           :uuid             not null, primary key
#  team_id      :uuid             not null
#  work_id      :bigint           not null
#  work_step_id :bigint           not null
#  work_date    :datetime
#  facilitator  :string
#  presenter    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Workshop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
