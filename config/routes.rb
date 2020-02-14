Rails.application.routes.draw do
  resources :events
  get 'users/show'
  get 'home/index'
  devise_for :users

  resources :users, :only => [:show] do

  end

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
