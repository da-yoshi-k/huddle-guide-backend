class ParticipationResource
  include Alba::Resource

  root_key :participation, :participations

  attributes :id, :user_id, :workshop_id
end
