Rails.application.routes.draw do
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  get 'pages/link'
  #resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
#追記
  #get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  get 'comments/index'
  get 'comments/new'
  post '/comments', to: 'comments#create'
#post '/comments/:topic_id/create', to: 'comments#create', as:'comments_create'
#追記
  
  resources :users
  resources :topics
#追記
#resources :comments
#追記
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  delete '/favorites', to: 'favorites#destroy'
end


