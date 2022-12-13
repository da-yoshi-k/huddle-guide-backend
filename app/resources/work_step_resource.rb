class WorkStepResource
  include Alba::Resource

  root_key :work_step, :work_steps

  attributes :id, :name
end
