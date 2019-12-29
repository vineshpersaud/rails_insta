Rails.application.routes.draw do
  get 'users/create'
  get 'users/signup'
  get 'users/login'
  get 'users/show'

  post 'users/create'
  
  post 'sessions/create_session'

  post 'posts/create'

  get 'posts/new'
  get 'posts/show'
  get 'posts/post_feed'

  delete '/logout', to: 'sessions#destroy'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
