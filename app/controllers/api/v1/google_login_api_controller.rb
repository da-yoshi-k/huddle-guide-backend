class Api::V1::GoogleLoginApiController < Api::V1::BaseController
  require 'googleauth/id_tokens/verifier'

  def callback
    unless params[:credential].present?
      return head :unauthorized
    end

    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV['GOOGLE_CLIENT_ID'])
    user = User.find_by(email: payload['email'])
    unless user
      user_params = {
        email: payload['email'],
        login_type: :google,
        name: payload['name'].slice(0, 20)
      }
      user = User.new(user_params)
      user.remote_avatar_url = payload['picture'] unless payload['picture'].blank?
    end
    if user.save
      token = user.create_tokens
      render json: { token: }
    else
      head :unauthorized
    end
  end
end
