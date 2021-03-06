Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "main#index", as: "home"
  get "about", to: "about#index", as: "about"

  #harusnya only on guest
  get "sign-up", to: "registration#new", as: "registration"
  post "sign-up", to: "registration#store", as: "registrationpost"
  get "login", to: "sessions#login", as: "login"
  post "login", to: "sessions#store", as: "loginstore"

  get "password/reset", to: "password_resets#index", as: "forgopassword"
  post "password/reset/store", to: "password_resets#store", as: "forgopasswordstore"
  get "password/reset/edit", to: "password_resets#edit", as: "forgopasswordedit"
  patch "password/reset/update", to: "password_resets#update", as: "forgopasswordupdate"

  # ini harusnya only on auth
  delete "logout", to: "sessions#destroy", as: "logout"

  get "change-password", to: "passwords#edit", as: "changepassword"
  patch "change-password", to: "passwords#update", as: "changepasswordstore"
end
