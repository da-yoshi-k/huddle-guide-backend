class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate!, only: %i[me search]

  def create
    user = User.new(user_params)
    if user.save
      json_str = UserResource.new(user).serialize
      render json: json_str
    else
      render_400(nil, user.errors.full_messages)
    end
  end

  def me
    json_str = UserResource.new(current_user).serialize
    render json: json_str
  end

  def search
    user = User.where(user_search_params).first
    json_str = if user
                 UserResource.new(user).serialize
               else
                 '{"user":{}}'
               end
    render json: json_str
  end

  private

  def form_authenticity_token; end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def user_search_params
    params.require(:user).permit(:email)
  end
end
