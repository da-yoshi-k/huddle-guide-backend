class AdvancementResource
  include Alba::Resource

  root_key :advancement, :advancements

  attributes :id, :content, :user_id, :workshop_id, :advancement_type
end
