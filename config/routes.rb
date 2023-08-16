Rails.application.routes.draw do
  
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
  resources :lawyer_details, except: [:destroy]
  resources :news
  resources :cases
  get '/*a', to: 'application#not_found'

  post 'login', to: 'users#login'


end
