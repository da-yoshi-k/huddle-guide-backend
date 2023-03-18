# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  role       :integer          default("general"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_members_on_team_id  (team_id)
#  index_members_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validations' do
    it { is_expected.to define_enum_for(:role).with_values(%i[general admin]) }
  end

  describe 'methods' do
    describe '#team_member_limit' do
      let(:team) { create(:team) }

      before do
        users = create_list(:user, 8)
        users.each do |user|
          create(:member, team:, user:)
        end
      end

      it 'does not return an error if the maximum number of participants to a team is not exceeded' do
        user = create(:user)
        team = create(:team)
        member = build(:member, team:, user:)
        member.valid?
        expect(member.errors[:base]).to be_empty
      end

      it 'returns an error if the maximum number of participants to a team is exceeded' do
        user = create(:user)
        member = build(:member, team:, user:)
        member.valid?
        expect(member.errors[:base]).to include('チームへの最大の参加人数を超えています')
      end
    end
  end
end
