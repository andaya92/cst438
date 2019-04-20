Rails.application.routes.draw do

  
  resources :checkins
  resources :session
  resources :roles
  resources :users
  root 'home#index'
  
  get "api/users/:id/" => "users#showAPI"
  get "api/users/" => "users#indexAPI"
  post "api/auth_member/:id/" => "session#auth_member"
  post "api/workouts/new/" => "workouts#create"
  get "api/workouts/:user_id/" => "workouts#show"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
