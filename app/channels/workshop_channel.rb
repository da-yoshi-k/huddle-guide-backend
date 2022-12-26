class WorkshopChannel < ApplicationCable::Channel
  def subscribed
    stream_from("workshop:#{params[:room]}")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test
    ActionCable.server.broadcast("workshop:#{params[:room]}", { body: "「#{params[:room]}」を購読中です" })
  end

  def speak(data)
    content = {
      type: 'chat_message',
      body: {
        name: data['name'],
        message: data['message'],
        spoke_at: Time.zone.now,
      },
    }
    ActionCable.server.broadcast("workshop:#{params[:room]}", content)
  end
end
