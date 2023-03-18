require 'rails_helper'

RSpec.describe WorkshopChannel, type: :channel do
  let(:user) { create(:user) }
  let(:workshop) { create(:workshop) }

  before do
    stub_connection current_user: user
    subscribe workshop_id: workshop.id
  end

  it 'successfully subscribes' do
    expect(subscription).to be_confirmed
  end
end
