Rails.application.routes.draw do
  
  
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :products do
    resources :orders, only: [:new, :create]
  end
  resources :categories, only: [:index, :show]
  resources :charges, only: [:new, :create]
  resources :profiles, only: [:new, :edit, :create]
  resources :subscribers
  resources :businesses
  resources :business_categories, only: [:index, :show]
  resources :states, only: [:index, :show]
  resources :orders
  resources :tags, only: [:index, :show]

  get 'vendor' => "products#vendor"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  get 'profile', to: 'profiles#current'
  get 'profile/connect_stripe', to: 'profiles#connect_stripe'
  get 'charges/new'
  get 'charges/create'
  get 'pages/about'
  get 'pages/contact'
end
