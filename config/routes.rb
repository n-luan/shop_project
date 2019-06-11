Rails.application.routes.draw do
  root "static_pages#home"

  resources :products, only: [:index, :show]
  resource :quick_views
  devise_for :users, controller: {sessions: "users/sessions#new"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "index", to: "home_pages#index"
  get "login", to: "sessions#new"
  resources :categories, only: [:show]
  resources :reviews
  namespace :admin do
    root "dashboard#index"
  end
end
