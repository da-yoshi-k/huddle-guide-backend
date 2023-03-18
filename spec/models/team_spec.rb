# == Schema Information
#
# Table name: teams
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it { should have_many(:members) }
    it { should have_many(:users).through(:members) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
