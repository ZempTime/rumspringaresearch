Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :papers

  get "/search", to: "search#index", as: :search

  root to: "search#landing"
end
