class TeamResource
  include Alba::Resource

  root_key :team, :teams

  attributes :id, :name, :description

  many :users, resource: UserResource
  many :members, resource: MemberResource
end
