Rails.application.routes.draw do
  get 'user/create'
  get 'user/signup'
  get 'user/login'
  get 'user/create'
  post 'posts/create'
  get 'posts/new'
  get 'posts/show'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
