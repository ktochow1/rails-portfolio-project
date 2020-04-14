Rails.application.routes.draw do

  delete '/lists/:id', to: 'lists#destroy'
  get 'login', to: 'sessions#new'
  delete '/tasks/:id', to: 'tasks#destroy'
  patch '/tasks/:id', to: 'tasks#update'
  get '/users/most_lists', to: 'users#most_lists'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#delete'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get '/auth/facebook/callback' => 'sessions#oauth_login'

  post '/users/:id', to: 'users#update'

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
