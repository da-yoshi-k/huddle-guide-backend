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
    message_params = {
      workshop: workshop,
      user: current_user,
      content: params[:message][:content]
    }
    message = Message.create(message_params)
    content = {
      type: 'create_message',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{workshop.id}", content)
    json_str = MessageResource.new(message).serialize
    render json: json_str
  end
end
