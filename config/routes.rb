Rails.application.routes.draw do
  root 'api/v1/works#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :works, only: %i[index]
      resource :users, only: %i[create]
      resource :authentication, only: %i[create]
    end
  end
end
