Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations'}

  get "/dashboard", to: "dashboard#show"

  namespace :dashboard do
    resources :pots, only: [:index, :show, :new, :create, :destroy] do
      resources :pot_friends, only: [:new, :create]
    end

    resources :coffees, only: [:index, :show] do
      member do
        get :accept
        get :deny
        get :cancel
      end
    end
  end

  resources :friends, :controller => 'friendships', :except => [:show, :edit] do
    get "requests", :on => :collection
    get "invites", :on => :collection
  end
end
