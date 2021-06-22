Rails.application.routes.draw do
  resources :homes
  resources :users
  resources :merit_moneys
  resources :dashboards
  get '/dashboard/deposit', to: 'dashboards#deposit'
  get '/dashboard/rank'

  get '/merit_moneys/deposit'
  get '/merit_moneys/received'
  get '/auth/google_oauth2/callback', to: 'homes#authentication'
  get '/homes/authentication', to: 'homes#authentication'

  root 'homes#index'


end