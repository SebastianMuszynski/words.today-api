Rails.application.routes.draw do
  get 'user_info', to: 'users#show'
  post 'users', to: 'users#create_and_login'
  post 'authenticate', to: 'authentication#authenticate'
  resources :users, only: [:update]
  resources :lists do
    resources :words do
      resources :translations
    end
  end
end
