Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :tasks, only: [:show]
  end
  resources :users do
    resources :lists, only: [:index]
  end

  resources :tasks
  # resources :sessions

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  get 'lists/:id/edit', to: 'lists#edit'
  patch 'lists/:id', to: 'lists#update'


  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'



end
