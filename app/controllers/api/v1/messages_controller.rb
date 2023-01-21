class Api::V1::MessagesController < Api::V1::BaseController
  before_action :authenticate!

  def index
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    messages = Message.where(workshop_id: workshop.id).recent
    json_str = MessageResource.new(messages).serialize
    render json: json_str
  end

  def create
    workshop = Workshop.where(team_id: current_user.teams).find(params[:workshop_id])
    message = Message.create(message_params)
    content = {
      type: 'create_message',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{workshop.id}", content)
    json_str = MessageResource.new(message).serialize
    render json: json_str
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, workshop_id: params[:workshop_id])
  end
end
