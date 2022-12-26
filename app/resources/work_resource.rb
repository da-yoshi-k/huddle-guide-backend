class WorkResource
  include Alba::Resource

  root_key :work, :works

  attributes :id, :name
end
