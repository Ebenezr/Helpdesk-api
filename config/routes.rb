Rails.application.routes.draw do
  # resources :bookmarks
   post 'bookmarks', to: 'bookmarks#build' 
   resources :questions, only: [:index, :show, :create, :update, :destroy]
   resources :users, only: [:index, :show, :create, :update, :destroy] 
   resources :tags, only: [:index, :show, :create, :update, :destroy]
   resources :solutions, only: [:index, :show, :create, :update, :destroy]
   post '/auth/login', to: 'authentication#login' 

end
