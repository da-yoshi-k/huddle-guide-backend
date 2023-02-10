class MemberResource
  include Alba::Resource

  root_key :member, :members

  attributes :id, :role, :user_id
end
