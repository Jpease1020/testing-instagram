Rails.application.routes.draw do
  root "welcome#index"
  get "/auth/instagram/callback", to: "sessions#create"
  get 'dashboard', to: 'users#show'
  delete 'logout', to: "sessions#destroy"
end
