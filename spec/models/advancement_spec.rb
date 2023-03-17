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
require 'rails_helper'

RSpec.describe Advancement, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:workshop) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end
