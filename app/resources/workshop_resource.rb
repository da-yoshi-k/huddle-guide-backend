class WorkshopResource
  include Alba::Resource

  root_key :workshop, :workshops

  attributes :id, :team_id, :work_id, :work_step_id, :work_date, :facilitator, :presenter, :work_start_time, :turn_start_time

  many :users, resource: UserResource
  one :work, resource: WorkResource
  one :work_step, resource: WorkStepResource
  one :team do
    attributes :id, :name
  end
end
