Rails.application.routes.draw do
  root 'home#index'

  resources :books
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :users

  as :user do
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end

  get 'catalog', to: 'books#index'
end
