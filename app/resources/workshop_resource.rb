class WorkshopResource
  include Alba::Resource

  root_key :workshop, :workshops

  attributes :id, :team_id, :work_id, :work_step_id, :work_date, :facilitator, :presenter

  many :users, resource: UserResource
  one :work, resource: WorkResource
  one :work_step, resource: WorkStepResource
  one :team, resource: TeamResource
end
