Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  get 'search', to: 'posts#search'

end
