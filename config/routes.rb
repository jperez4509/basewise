Rails.application.routes.draw do
  # Registration
  get "register" => "registrations#new", as: "new_registration"
  post "register" => "registrations#create", as: "create_registration"

  # Projects
  resources :projects

  # Users
  resources :users
end
