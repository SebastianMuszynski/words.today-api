Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'users', to: 'users#create_and_login'
  resources :lists
end
