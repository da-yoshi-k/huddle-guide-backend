Rails.application.routes.draw do
  root 'api/v1/works#index'

  namespace :api, format: 'json' do
    resources :works, only: %i[index]
  end
end
