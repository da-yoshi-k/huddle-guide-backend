class Api::V1::MembersController < Api::V1::BaseController
  before_action :authenticate!

  def create
    team = current_user.teams.find(params[:team_id])
    user = User.find(params[:user][:id])
    Member.create(team:, user:)
  end

  def destroy; end
end
