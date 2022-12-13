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
require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
