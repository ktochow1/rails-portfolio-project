Rails.application.routes.draw do
  get 'welcome', to: 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists
  resources :users
  resources :tasks

  get 'login', to: 'sessions#new'
  
  post 'login', to: 'sessions#create'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'authorized', to: 'sessions#require_login'
  # root 'welcome#index'
end
