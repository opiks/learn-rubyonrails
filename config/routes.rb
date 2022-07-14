Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "main#index", as: "home"
  get "about", to: "about#index", as: "about"
  get "sign-up", to: "registration#new", as: "registration"
  post "sign-up", to: "registration#new", as: "registrationpost"
end
