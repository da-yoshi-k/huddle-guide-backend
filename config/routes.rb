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
      resources :teams do
        resources :members, only: %i[create destroy]
      end
      resources :workshops, only: %i[create show update]
      resources :posts, only: %i[index create update]
    end
  end
end
