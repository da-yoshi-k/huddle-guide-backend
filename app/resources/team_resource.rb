class TeamResource
  include Alba::Resource

  root_key :team, :teams

  attributes :id, :name, :description
end
