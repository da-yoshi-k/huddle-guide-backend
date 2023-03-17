# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  avatar           :string
#  crypted_password :string
#  description      :text
#  email            :string           not null
#  login_type       :integer          default("default"), not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'is valid with valid attributes' do
      expect(build(:user)).to be_valid
    end

    it 'is invalid without name' do
      expect(build(:user, name: nil)).not_to be_valid
    end

    it 'is invalid without email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'is invalid with duplicate email' do
      create(:user, email: 'test+1@example.com')
      expect(build(:user, email: 'test+1@example.com')).not_to be_valid
    end

    it 'is invalid without password in password login' do
      expect(build(:user, password: nil)).not_to be_valid
    end

    it 'is valid without password in google login' do
      expect(build(:user, :user_with_google_login, password: nil)).to be_valid
    end
  end
end
