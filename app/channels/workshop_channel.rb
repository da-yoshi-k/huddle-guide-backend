class WorkshopChannel < ApplicationCable::Channel
  def subscribed
    stream_from("workshop:#{params[:room]}")
    content = {
      type: 'join_workshop',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update_work_step
    content = {
      type: 'update_work_step',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def update_presenter
    content = {
      type: 'update_presenter',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def edit_posts
    content = {
      type: 'edit_posts',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end

  def end_workshop
    content = {
      type: 'end_workshop',
      body: {}
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end
end
