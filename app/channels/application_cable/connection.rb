module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # タイムアウト時の挙動検証のため、コメントアウト
    # identified_by :current_user
  end
end
