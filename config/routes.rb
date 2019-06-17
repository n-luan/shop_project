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
  namespace :admin do
    root "dashboard#index"
    resources :category
  end

  resource :quick_views
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :reviews
  resources :product_orders, only: [:create, :destroy]
  resources :orders
end
