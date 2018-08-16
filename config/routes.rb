Rails.application.routes.draw do
get '/startups', to: 'home#startups'
get '/students', to: 'home#students'
    resources :users

  root 'home#index'

end
