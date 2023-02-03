class WorkshopStandbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from("workshop_standby:#{params[:room]}")
  rescue StandardError => e
    logger.error e
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_workshop
    content = {
      type: 'start_workshop',
      body: {}
    }
    ActionCable.server.broadcast("workshop_standby:#{params[:room]}", content)
  rescue StandardError => e
    logger.error e
  end
end
