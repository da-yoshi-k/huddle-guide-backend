class Api::V1::TeamsController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_my_teams, only: %i[index]

  def index
    json_str = TeamResource.new(@teams).serialize
    render json: json_str
  end

  def create
    team_params = {
      name: params[:team][:name],
      description: params[:team][:description]
    }
    @team = Team.new(team_params)
    unless @team.save
      render_400(nil, @team.errors.full_messages)
    end
    member = Member.create(user: current_user, team: @team, role: :admin)
    json_str = TeamResource.new(@team).serialize
    render json: json_str
  end

  private

  def set_my_teams
    @teams = current_user.teams
  end
end
