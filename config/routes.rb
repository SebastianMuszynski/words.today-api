Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'users', to: 'users#create'
end
