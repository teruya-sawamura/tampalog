Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]

end
