class Api::V1::WorkshopsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshops = Workshop.where(teams: current_user.teams).includes([:users]).includes([:work]).includes([:work_step]).includes([:team]).order(created_at: :desc).limit(10)
    json_str = WorkshopResource.new(workshops).serialize
    render json: json_str
  end

  def show
    workshop = Workshop.where(team_id: current_user.teams).find(params[:id])
    json_str = WorkshopResource.new(workshop).serialize
    render json: json_str
  end

  def create
    workshop = Workshop.new(workshop_params)
    if workshop.save
      Participation.create(user: current_user, workshop:)
      json_str = WorkshopResource.new(workshop).serialize
      render json: json_str
    else
      render_400(nil, workshop.errors.full_messages)
    end
  end

  def update
    @workshop = Workshop.where(team_id: current_user.teams).find(params[:id])
    @workshop.update(workshop_update_params)
  end

  private

  def workshop_params
    params.require(:workshop).permit(:work_id, :team_id).merge(work_step_id: 1, work_date: Time.current, facilitator: current_user.id)
  end

  def workshop_update_params
    params.require(:workshop).permit(:work_step_id, :facilitator, :presenter, :work_start_time, :turn_start_time)
  end
end
