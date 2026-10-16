Rails.application.routes.draw do
  resources :users,  only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:create, :destroy]
  resources :likes,  only: [:create, :destroy]
  post 'top/login'
  get  'top/logout'
  root 'top#main'
end