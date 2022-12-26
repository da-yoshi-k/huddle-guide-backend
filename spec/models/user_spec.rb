# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  avatar           :string
#  crypted_password :string
#  description      :text
#  email            :string           not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
