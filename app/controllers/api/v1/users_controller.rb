class Api::V1::UsersController < Api::V1::BaseController
  # skip_before_action :authenticate

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

  private

  def form_authenticity_token; end
end
