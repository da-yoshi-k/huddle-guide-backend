require 'rails_helper'

RSpec.describe 'Api::V1::Workshops', type: :request do
  let!(:current_user) { create(:user, :user_with_teams) }
  let!(:work_step) { WorkStep.create_with(attributes_for(:work_step, :waiting)).find_or_create_by!(id: 1) }

  before do
    authorization_stub
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/workshops'
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of workshops' do
      create_list(:workshop, 5, team: current_user.teams.first)
      get '/api/v1/workshops'
      res = JSON.parse(response.body)
      expect(res['workshops'].size).to eq(5)
    end

    it 'returns a list of workshops with latest 10 workshops' do
      create_list(:workshop, 15, team: current_user.teams.first)
      get '/api/v1/workshops'
      res = JSON.parse(response.body)
      expect(res['workshops'].size).to eq(10)
    end

    it 'should not returns a list of workshops with other users workshops' do
      create_list(:workshop, 5, team: current_user.teams.first)
      create_list(:workshop, 4)
      get '/api/v1/workshops'
      res = JSON.parse(response.body)
      expect(res['workshops'].size).to eq(5)
    end

    it 'returns a list of workshops with current_users all teams' do
      team = create(:team)
      other_team = create(:team)
      team.users << current_user
      other_team.users << current_user
      create_list(:workshop, 5, team:)
      create_list(:workshop, 4, team: other_team)
      get '/api/v1/workshops'
      res = JSON.parse(response.body)
      expect(res['workshops'].size).to eq(9)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      workshop = create(:workshop, team: current_user.teams.first)
      get "/api/v1/workshops/#{workshop.id}"
      expect(response).to have_http_status(:success)
    end

    it 'returns a workshop' do
      workshop = create(:workshop, team: current_user.teams.first)
      get "/api/v1/workshops/#{workshop.id}"
      res = JSON.parse(response.body)
      expect(res['workshop']['id']).to eq(workshop.id)
    end

    it 'should not return a workshop with other users workshop' do
      workshop = create(:workshop)
      get "/api/v1/workshops/#{workshop.id}"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      team = current_user.teams.first
      work = create(:work, :finding_common_interets)
      post '/api/v1/workshops', params: { workshop: { team_id: team.id, work_id: work.id } }
      expect(response).to have_http_status(:success)
    end

    it 'returns a workshop' do
      team = current_user.teams.first
      work = create(:work, :finding_common_interets)
      post '/api/v1/workshops', params: { workshop: { team_id: team.id, work_id: work.id } }
      res = JSON.parse(response.body)
      expect(res['workshop']['team_id']).to eq(team.id)
      expect(res['workshop']['work_id']).to eq(work.id)
      expect(res['workshop']['work_step_id']).to eq(work_step.id)
      expect(res['workshop']['facilitator']).to eq(current_user.id)
      expect(res['workshop']['presenter']).to eq(nil)
      expect(res['workshop']['work_date']).to_not eq(nil)
    end

    it 'should not return a workshop with other users team' do
      team = create(:team)
      work = create(:work, :finding_common_interets)
      post '/api/v1/workshops', params: { workshop: { team_id: team.id, work_id: work.id } }
      expect(response).to have_http_status(:not_found)
    end
  end
end
