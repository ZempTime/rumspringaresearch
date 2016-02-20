Rails.application.routes.draw do
  devise_for :users
  resources :papers

  root to: "papers#index"
end
