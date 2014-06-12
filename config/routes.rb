Rails.application.routes.draw do
  get 'pages/new'

  root "users#index"
  resources :users
  resources :books do
    resources :pages
  end
end
