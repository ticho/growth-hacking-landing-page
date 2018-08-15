Rails.application.routes.draw do
  get 'users/create'
  get 'user/create'
  resources :users
  root 'home#index'
end
