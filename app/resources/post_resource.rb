class PostResource
  include Alba::Resource

  root_key :post, :posts

  attributes :id, :content, :user_id, :workshop_id, :level
end
