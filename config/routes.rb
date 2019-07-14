Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenida", to: "home#index"
  resources :categories
  resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection
  end
  get "perfil", to: "users#edit"
=begin
  get "articles", to: "articles#index"
  get "articles/user/:id", to: "articles#from_author"
  get "articles/new", to: "articles#new", as: :new_articles
  post "articles", to: "articles#create"
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update", as: :article
  delete "articles/:id", to: "articles#destroy"
=end
end
