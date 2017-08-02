Rails.application.routes.draw do
  root 'home#index'

  resources :books
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :users
  as :user do
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
    get 'sign_up', to: 'users/registrations#new'
    post 'sign_up', to: 'users/registrations#create'
  end

  get 'catalog', to: 'books#index'
end
