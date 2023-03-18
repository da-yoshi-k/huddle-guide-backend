# == Schema Information
#
# Table name: work_steps
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe WorkStep, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
