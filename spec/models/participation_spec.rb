# == Schema Information
#
# Table name: participations
#
#  id          :bigint           not null, primary key
#  is_active   :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :uuid             not null
#  workshop_id :uuid             not null
#
# Indexes
#
#  index_participations_on_user_id      (user_id)
#  index_participations_on_workshop_id  (workshop_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workshop_id => workshops.id)
#
require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
