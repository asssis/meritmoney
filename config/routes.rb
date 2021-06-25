Rails.application.routes.draw do
  resources :homes
  resources :users
  resources :merit_moneys
  resources :dashboards
  get '/dashboard/received', to: 'dashboards#received'
  get '/dashboard/rank', to: 'dashboards#rank'
  get '/dashboard/rank/:date', to: 'dashboards#rank'

  get '/merit_money/view_resume/:user_id', to: 'merit_moneys#view_resume'

  get '/auth/google_oauth2/callback', to: 'homes#authentication'
  get '/homes/authentication', to: 'homes#authentication'

  root 'homes#index'


end