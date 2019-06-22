Rails.application.routes.draw do

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenida", to: "home#index"

  get "articles", to: "articles#index"

  get "articles/new", to: "articles#new", as: :new_articles
  post "articles", to: "articles#create"
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update", as: :article
  delete "articles/:id", to: "articles#destroy"

end
