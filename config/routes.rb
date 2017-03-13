Rails.application.routes.draw do
  resources :words
  post 'authenticate', to: 'authentication#authenticate'
  post 'users', to: 'users#create_and_login'
  resources :lists
end
