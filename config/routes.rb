Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
    resources :tasks, only: [:show, :new, :index, :create]
    resources :project_assignments, only: [:show, :new, :index, :create]
  end
  resources :project_assignments, only: :destroy
  resources :users do
    resources :project_assignments, only: [:show, :new, :index, :create]
  end

  get '/lists', to: 'lists#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'



end
