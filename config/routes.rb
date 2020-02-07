Rails.application.routes.draw do
  get 'welcome', to: 'sessions#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists, except: :destroy
  resources :users
  resources :tasks
  # resources :sessions

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#delete'
  delete '/lists/:id', to: 'lists#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # get 'logout', to: 'sessions#delete'

end
