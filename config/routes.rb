Rails.application.routes.draw do

  root "static_pages#home"

  devise_for :users, skip: :all
    as :user do
      get "/login" => "devise/sessions#new", :as => :new_user_session
      post "/login" => "devise/sessions#create", :as => :user_session
      delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
      get "/register" => "devise/registrations#new", :as => :new_user_registration
      post "/register" => "users/registrations#create", :as => :user_registration
    end

  namespace :users do
      resources :profiles, only: [:show, :edit, :update]
  end

  namespace :manager do
    root "dashboard#index"
    resources :category
    resources :products
    resources :notifications
    resources :orders
    mount ActionCable.server => '/cable'
  end

  devise_for :admins, controllers: {
    sessions: "manager/admins/sessions",
  }, path: "admin", path_names: { sign_in: "login" }

  resource :quick_views
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :reviews
  resources :product_orders, only: [:create, :destroy]
  resources :orders
  resources :notifications
end
