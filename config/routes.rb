Rails.application.routes.draw do
  post 'users', to: 'users#create_and_login'
  post 'authenticate', to: 'authentication#authenticate'
  resources :lists
  resources :words
end
