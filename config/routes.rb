Rails.application.routes.draw do
  
  resources :posts

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
    # :confirmations => 'users/confirmations',
    # :unlocks => 'users/unlocks',
  }
  
  resources :users do
    member do
      get 'posts' => 'posts#index'
    end
    member do
      get :following, :followers
    end
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#top"
  get 'menu' => 'home#menu'
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  

  resources :posts do
    member do
     get :favorite
  end
  end
  resources :relationships,       only: [:create, :destroy]
  
  root "users#index" #この辺りは作成するアプリの要件により異なる。
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

end
