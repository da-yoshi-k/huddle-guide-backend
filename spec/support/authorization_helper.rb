module AuthorizationHelper
  def authorization_stub
    allow_any_instance_of(Api::V1::BaseController).to receive(:authenticate!).and_return(current_user)
    allow_any_instance_of(Api::V1::BaseController).to receive(:current_user).and_return(current_user)
  end
end
