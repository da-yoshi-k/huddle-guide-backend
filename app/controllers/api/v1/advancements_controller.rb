class Api::V1::AdvancementsController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    advancements = Advancement.where(workshop_id: workshop.id)
    json_str = AdvancementResource.new(advancements).serialize
    render json: json_str
  end

  def create
    count = Advancement.where(user: current_user.id, workshop: params[:workshop_id]).count
    return unless count.zero?

    advancement = Advancement.new(advancement_params)
    advancement.save
  end

  def update
    advancement = current_user.advancements.find(params[:advancement][:id])
    advancement.update(advancement_params)
  end

  private

  def advancement_params
    params.require(:advancement).permit(:content, :advancement_type).merge(user_id: current_user.id, workshop_id: params[:workshop_id])
  end
end
