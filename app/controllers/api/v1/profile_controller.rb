class Api::V1::ProfileController < Api::V1::BaseController
  before_action :authenticate!

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      json_str = UserResource.new(user).serialize
      render json: json_str
    else
      render_400(nil, user.errors.full_messages)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :avatar)
  end
end
