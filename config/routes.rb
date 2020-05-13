Rails.application.routes.draw do
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: "pages#home"
   root to: "pages#home"

  resources :products do
    resources :orders, only: [:new, :create] 
    resources :reviews
    resources :votes
  end

  put 'shipped_order', to: 'orders#shipped', as: :shipped_orders  


  resources :users do
    member do
      post :follow
      post :unfollow
      get :followers
      get :following
    end

    # get 'followers' => "users#followers"
    # get 'following' => "users#following"
    get "/:id", :to => "users#show", :as => :friendly_user
  end



  resources :categories, only: [:index, :show]
  resources :charges, only: [:new, :create]
  # resources :profiles, only: [:new, :edit, :create]
  resources :subscribers
  resources :businesses do
      collection { post :search, to: 'businesses#index' }
  end

  resources :conversations, only: [:index, :create] do
    resources :personal_messages, only: [:index, :create]
  end

  # resources :business_categories, only: [:index, :show]
  # resources :states, only: [:index, :show]
  # resources :orders
  resources :tags, only: [:index, :show]

  # get 'vendor' => "products#vendor"\
  # get '/:username' => 'users#show', :constrain => { :username => /[a-zA-Z-]+/ }
  delete 'unsubscribe' => 'subscribers#unsubscribe'
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  get 'checkout' => "orders#checkout"
 
  # get 'product/:id/likes', to: 'products#likes', as: :likes
  # get 'product/:id/unlikes', to: 'products#unlikes', as: :unlikes
  get 'charges/new'
  get 'charges/create'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/home'
  get 'pages/countdown'
end
