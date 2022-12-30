class Api::V1::MembersController < Api::V1::BaseController
  before_action :authenticate!

  def create
    team = current_user.teams.find(params[:team_id])
    user = User.find(params[:user][:id])
    member = Member.create(team: team, user: user)
  end

  def destroy; end
end
