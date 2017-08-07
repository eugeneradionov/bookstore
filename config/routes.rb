Rails.application.routes.draw do
  resources :order_items, only: [:create, :destroy]
  root 'home#index'

  resources :books
  resources :users

  as :user do
    get 'login', to: 'users/sessions#new'
    post '/users/sign_in', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'

    get 'sign_up', to: 'users/registrations#new'
    post 'sign_up', to: 'users/registrations#create'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  get 'catalog', to: 'books#index'
  get 'cart', to: 'carts#show'
  post 'cart', to: 'carts#update'
  delete 'cart', to: 'carts#destroy'
end
