class Api::V1::AuthenticationsController < Api::V1::BaseController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      token = user.create_tokens
      render json: { token: }
    else
      head :unauthorized
    end
  end

  private

  def form_authenticity_token; end
end
