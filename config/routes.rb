Rails.application.routes.draw do

  get 'session/create'

  get 'session/destroy'

  get 'session/new'

  #Session
  get "signin" => "session#new", as: "signin"
  post "login" => "session#create", as: "login"
  delete "logout" => "session#destroy", as: "logout"

  # Registration
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"


  # Projects
  resources :projects

  # Users
  #resources :users
end
