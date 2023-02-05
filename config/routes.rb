Rails.application.routes.draw do
  root 'tops#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'guest_login', to: 'user_sessions#guest_login'
  delete 'logout', to: 'user_sessions#destroy'
  get 'search', to: 'searches#search'
  get 'search_result', to: 'searches#result'
  get 'laugh_logs/new/:id', to: 'laugh_logs#new', as: 'new_laugh_log'
  post 'laugh_logs', to: 'laugh_logs#create'
  resources :users, only: %i[new create destroy]
  resources :posts, only: %i[index]
end
