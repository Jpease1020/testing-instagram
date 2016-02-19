Rails.application.routes.draw do
  root "welcome#index"
  get '/auth/instagram', as: :login
  get "/auth/instagram/callback", to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :dashboard, only: [:index]
  resources :followers, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
end
