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
require 'rails_helper'

RSpec.describe WorkStep, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
