Rails.application.routes.draw do

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#delete'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get '/auth/facebook/callback' => 'sessions#oauth_login'

  get '/lists', to: 'lists#index'

  resources :lists do
    resources :tasks, only: [:show, :new, :index, :create, :edit]
    resources :project_assignments, only: [:show, :new, :index, :create]
  end
  resources :project_assignments, only: :destroy
  resources :tasks, only: [:destroy, :update]
  resources :users do
    resources :project_assignments, only: [:show, :new, :index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
