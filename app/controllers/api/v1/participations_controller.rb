class Api::V1::ParticipationsController < Api::V1::BaseController
  before_action :authenticate!

  def create
    workshop = Workshop.find(params[:workshop_id])
    return unless Participation.create(workshop:, user: current_user)

    content = {
      type: 'join_member',
      body: {
        user: current_user
      }
    }
    ActionCable.server.broadcast("workshop_standby:#{params[:workshop_id]}", content)
  end

  def destroy; end
end
