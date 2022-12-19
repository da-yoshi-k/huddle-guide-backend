class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate!, only: %i[me]

  def create
    user_params = {
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password]
    }
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

  private

  def form_authenticity_token; end
end
