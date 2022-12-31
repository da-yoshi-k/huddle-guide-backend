class WorkshopStandbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from("workshop_standby:#{params[:room]}")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_workshop(data)
    content = {
      type: 'start_workshop',
      body: {},
    }
    ActionCable.server.broadcast("workshop_standby:#{params[:room]}", content)
  end
end
