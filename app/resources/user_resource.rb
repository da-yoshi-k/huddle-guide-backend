class UserResource
  include Alba::Resource

  root_key :user, :users

  attributes :id, :email, :name, :description
end
