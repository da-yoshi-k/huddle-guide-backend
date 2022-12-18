class Api::V1::AuthenticationsController < Api::V1::BaseController
  # skip_before_action :authenticate

  def create
    user = login(params[:email], params[:password])

    raise ActiveRecord::RecordNotFound unless user

    json_str = UserResource.new(user).serialize
    render json: json_str
  end

  private

  def form_authenticity_token; end
end
