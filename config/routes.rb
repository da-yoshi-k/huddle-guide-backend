Rails.application.routes.draw do
  root 'api/v1/works#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :works, only: %i[index]
      resource :users do
        collection do
          get 'me'
        end
      end
      resource :authentication, only: %i[create]
      resources :profile
    end
  end
end
