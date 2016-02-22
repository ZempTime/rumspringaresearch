Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resources :papers do
    resources :attachments, only: [] do
      member do
        get "/download", to: "papers#download", as: :download
      end
    end
  end

  get "/search", to: "search#index", as: :search
  get "/about", to: "search#about", as: :about



  root to: "search#landing"
end
