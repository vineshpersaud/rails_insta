Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests, only: [:create]
  get 'users/create'
  get 'users/signup'
  get 'users/login'
  get 'users/show'
  get 'users/find'

  post 'users/create'
  
  post 'sessions/create_session'

  post 'posts/create'

  post 'likes/create'

  post 'follows/create'
  delete 'follows/destroy'
  
  get 'posts/new'
  get 'posts/show/:id' , to: "posts#show", as: 'post_show'
  get 'posts/post_feed'
  get 'posts/my_post'

  post 'comments/create'

  get 'friend_requests/find_friends', to: 'friend_requests#find_friends'

  delete '/logout', to: 'sessions#destroy'

  root to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
