class Api::V1::TeamsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    teams = current_user.teams.includes([:users])
    json_str = TeamResource.new(teams).serialize
    render json: json_str
  end

  def show
    team = current_user.teams.find(params[:id])
    json_str = TeamResource.new(team).serialize
    render json: json_str
  end

  def create
    team_params = {
      name: params[:team][:name],
      description: params[:team][:description]
    }
    @team = Team.new(team_params)
    unless @team.save
      return render_400(nil, @team.errors.full_messages)
    end

    Member.create(user: current_user, team: @team, role: :admin)
    json_str = TeamResource.new(@team).serialize
    render json: json_str
  end
end
