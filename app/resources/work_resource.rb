class WorkResource
  include Alba::Resource

  root_key :work, :works

  attributes :id, :name

  many :work_steps, resource: WorkStepResource
end
