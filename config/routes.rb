Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
  resources :lawyer_details, except: [:destroy]
  resources :news
  resources :lawyer_details, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

end
