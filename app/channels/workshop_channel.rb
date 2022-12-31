class WorkshopChannel < ApplicationCable::Channel
  def subscribed
    stream_from("workshop:#{params[:room]}")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update_work_step(data)
    content = {
      type: 'update_work_step',
      body: {},
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def update_presenter(data)
    content = {
      type: 'update_presenter',
      body: {},
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def end_workshop(data)
    content = {
      type: 'end_workshop',
      body: {},
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end
end
