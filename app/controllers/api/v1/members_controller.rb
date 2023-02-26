class Api::V1::MembersController < Api::V1::BaseController
  before_action :authenticate!

  def create
    team = current_user.teams.find(params[:team_id])
    user = User.find(params[:user][:id])
    member = Member.new(team:, user:)
    if member.save
      json_str = MemberResource.new(member).serialize
      render json: json_str
    else
      render_400(nil, member.errors.full_messages)
    end
  end

  def update
    team = current_user.teams.find(params[:team_id])
    admin = team.members.admin.first
    admin.role = 'general'
    admin.save
    member = Member.find(params[:id])
    if member.update(member_params)
      json_str = MemberResource.new(member).serialize
      render json: json_str
    else
      render_400(nil, member.errors.full_messages)
    end
  end

  def destroy
    member = Member.find(params[:id])
    member.destroy!
  end

  private

  def member_params
    params.require(:member).permit(:role)
  end
end
