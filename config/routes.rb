Rails.application.routes.draw do
   resources :bookmarks,  only: [:create, :update, :destroy]
   resources :questions, only: [:index, :show, :create, :update, :destroy]
   resources :users, only: [:index, :show, :create, :update, :destroy] 
   resources :solutions, only: [:index, :show, :create, :update, :destroy]
   post '/auth/login', to: 'authentication#login' 
  #  return loged in users bookmarks
   get '/mybookmarks/:id', to: "bookmarks#mybookmarks"
   get '/mysolutions/:id', to: "solutions#mysolutions"
   get '/myquestions/:id', to: "questions#myquestions"
 
   #search for questions
   get '/search/:search_term', to: "questions#search"
   get '/filter/:tags', to: "questions#filter"
   
   #get frequently asked questions
   get '/faqs', to: "questions#faqs"

   # reset password
   get '/passwordreset/:email', to: "users#resetpassword"   

end
