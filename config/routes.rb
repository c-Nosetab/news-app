Rails.application.routes.draw do

  root 'pages#index'

  get 'pages/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
end
