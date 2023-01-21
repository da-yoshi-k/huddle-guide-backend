class UserResource
  include Alba::Resource

  root_key :user, :users

  attributes :id, :email, :name, :description

  attributes :avatar_url do |resource|
    !resource.url.nil? ? resource.url : ''
  end
end
