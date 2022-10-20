Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy] 
  # post '/auth/login', to: 'authentication#login'
 
end
