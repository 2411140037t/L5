Rails.application.routes.draw do
  resources :users,  only: [:index, :show, :new, :create, :destroy]
  resources :tweets, only: [:create, :destroy]
  resources :likes,  only: [:create, :destroy]
  resource  :profile, only: [:new, :create, :edit, :update]
  post 'top/login'
  get  'top/logout'
  root 'top#main'
end