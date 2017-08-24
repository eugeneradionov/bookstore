Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :reviews, only: [:create, :destroy]
  resources :order_items, only: [:create, :destroy]

  root 'home#index'

  resources :books
  resources :orders

  as :user do
    get 'login', to: 'users/sessions#new'
    post 'users/sign_in', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'

    get 'sign_up', to: 'users/registrations#new'
    post 'users/sign_up', to: 'users/registrations#create'
    post 'sign_up', to: 'users/registrations#create'

    get 'users/edit', to: 'users/registrations#edit'
    put 'users', to: 'users/registrations#update'
    delete 'users', to: 'users/registrations#destroy'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  get 'catalog', to: 'books#index'

  get 'cart', to: 'carts#show'
  post 'cart', to: 'carts#update'
  delete 'cart', to: 'carts#destroy'

  get 'checkout', to: 'checkout#new'
  post 'checkout', to: 'checkout#create'
  post 'checkouts', to: 'checkout#create'

  get 'checkout/complete', to: 'checkout#complete'
  get 'checkout/login', to: 'checkout#login'

  get 'settings', to: 'settings#edit'
  post 'settings', to: 'settings#update'
  delete 'settings', to: 'settings#destroy'
end
