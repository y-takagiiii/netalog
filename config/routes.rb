Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'tops#index'
  get 'terms_of_use', to: "tops#terms_of_use"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'guest_login', to: 'user_sessions#guest_login'
  post 'google_login/callback', to: 'google_logins#oauth'
  get 'google_login/callback', to: 'google_logins#oauth'
  get 'google_login/:provider', to: 'google_logins#oauth', as: :auth_at_provider
  delete 'logout', to: 'user_sessions#destroy'

  get 'search', to: 'searches#search'

  get 'laugh_logs/new/:id', to: 'laugh_logs#new', as: 'new_laugh_log'
  post 'laugh_logs', to: 'laugh_logs#create'

  resources :users, only: %i[new create destroy]
  resources :posts, only: %i[index show destroy] do
    resource :likes, only: %i[create destroy]
    collection do
      get :popular
    end
  end
  resources :likes, only: :index
  resources :notifications, only: %i[index show]
  resources :password_resets, only: %i[new create edit update]
end
