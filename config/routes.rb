Rails.application.routes.draw do
   resources :questions_tags
   resources :bookmarks,  only: [:create, :update, :destroy]
   resources :questions, only: [:index, :show, :create, :update, :destroy]
   resources :users, only: [:index, :show, :create, :update, :destroy] 
   resources :tags, only: [:index, :show, :create, :update, :destroy]
   resources :solutions, only: [:index, :show, :create, :update, :destroy]
   post '/auth/login', to: 'authentication#login' 
  #  return loged in users bookmarks
   get '/mybookmarks', to: "bookmarks#mybookmarks"

end
