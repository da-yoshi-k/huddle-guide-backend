# == Schema Information
#
# Table name: workshops
#
#  id              :uuid             not null, primary key
#  facilitator     :string
#  presenter       :string
#  turn_start_time :datetime
#  work_date       :datetime
#  work_start_time :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  team_id         :uuid             not null
#  work_id         :bigint           not null
#  work_step_id    :bigint           not null
#
# Indexes
#
#  index_workshops_on_team_id       (team_id)
#  index_workshops_on_work_id       (work_id)
#  index_workshops_on_work_step_id  (work_step_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (work_id => works.id)
#  fk_rails_...  (work_step_id => work_steps.id)
#
require 'rails_helper'

RSpec.describe Workshop, type: :model do
  describe 'validations' do
    it 'should be valid if there are 6 participations' do
      workshop = build(:workshop, participations: build_list(:participation, 6))
      expect(workshop).to be_valid
    end

    it 'should not be valid if there are more than 6 participations' do
      workshop = build(:workshop, participations: build_list(:participation, 7))
      expect(workshop).not_to be_valid
    end
  end
end
