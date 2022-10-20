Rails.application.routes.draw do
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :create, :update, :destroy] 
  # post '/auth/login', to: 'authentication#login'
 
end
