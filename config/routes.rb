Rails.application.routes.draw do
  get 'tags/index'
  get 'pages/index'#getは後述レスポンスのgetメソッドで、HTTPリクエスト(検索した時の'https:'の部分')で渡したURLとコントローラーを紐づけるメソッド,
  #これによりpages/indexというURLとpages#indexというアクションを紐づけられる。
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'#トップページにアクセスするとpages#indexアクションにリクエストが振り分けられるという定義
  get 'pages/help'
  get 'pages/link'
  #resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'comments/index'
  get 'comments/new'
  post '/comments', to: 'comments#create'
  resources :users
  resources :topics
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end


