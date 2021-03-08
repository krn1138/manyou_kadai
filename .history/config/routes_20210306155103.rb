Rails.application.routes.draw do
  resources :sessions
  resources :tasks
  resources :users
  root "tasks#index"

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
