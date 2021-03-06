Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
    }

  resources :users, :only => [:show] do
      resources :events
  end

  get 'users/:id/upcoming' , to: 'users#upcoming', as: 'user_upcoming'
  get 'users/:id/past', to: 'users#past', as: 'user_past'
  get 'users/:id/noresult', to: 'users#no_result', as: 'user_noresult'

  resources :events, :only => [:index, :show]

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
