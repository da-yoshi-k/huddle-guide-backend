class UserResource
  include Alba::Resource

  root_key :user, :users

  attributes :id, :email, :name, :description, :login_type

  attributes :avatar_url do |resource|
    !resource.url.nil? ? resource.url : ''
  end
end
