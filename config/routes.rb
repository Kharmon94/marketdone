Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :products
  resources :profiles
  resources :categories
  resources :charges, only: [:new, :create]
  get 'vendor' => "products#vendor"
  get 'profile', to: 'profiles#current'
  get 'profile/connect_stripe', to: 'profiles#connect_stripe'
  get 'charges/new'
  get 'charges/create'
  get 'pages/about'
  get 'pages/contact'
end
