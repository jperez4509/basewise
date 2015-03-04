Rails.application.routes.draw do

  # Registration
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"
  resources :register, only: [:create, :new]

  # Projects
  resources :projects

  # Users
  #resources :users
end
