require "clearance/constraints/signed_in"

Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", as: :constraints_root
  end
  root to: "home#show"
  resources :shouts, only: [:create, :show, :new] do 
    member do 
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end 
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:new, :create, :destroy]
  # , only: [:create]

  resources :users, only: [:new, :create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end