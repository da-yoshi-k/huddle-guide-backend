class MessageResource
  include Alba::Resource

  root_key :message, :messages

  attributes :id, :content, :user_id, :workshop_id, :created_at
end
