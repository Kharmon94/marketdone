Rails.application.routes.draw do
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  resources :products do
    resources :orders, only: [:new, :create]
    resources :reviews
  end
  resources :users do
    member do
      post :follow
      post :unfollow
    end
  end
  resources :categories, only: [:index, :show]
  resources :charges, only: [:new, :create]
  # resources :profiles, only: [:new, :edit, :create]
  resources :subscribers
  resources :businesses do
      collection { post :search, to: 'businesses#index' }
  end

  resources :conversations, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end

  # resources :business_categories, only: [:index, :show]
  # resources :states, only: [:index, :show]
  # resources :orders
  resources :tags, only: [:index, :show]

  # get 'vendor' => "products#vendor"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  # get 'profile', to: 'profiles#current'
  # get 'profile/connect_stripe', to: 'profiles#connect_stripe'
  get 'charges/new'
  get 'charges/create'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/home'
end
