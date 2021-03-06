Rails.application.routes.draw do

  get 'charges/create'
  post 'users/downgrade' => 'users#downgrade'

  resources :wikis do
    resources :collaborators
  end

  root 'welcome#index'
  get 'about' => 'welcome#about'

  # devise_for :users
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :users

  resources :charges, only: [:new, :create]


end
