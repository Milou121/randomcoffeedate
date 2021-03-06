Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations'}

  get "/dashboard", to: "dashboard#show"

  namespace :dashboard do
    resources :pots, only: [:index, :show, :new, :create, :destroy] #do
      # resources :pot_friends, only: [:new, :create]
    # end

    resources :cups, only: [:index, :show] do
      member do
        patch :cancel
      end
    end
  end

  resources :friends, :controller => 'friendships', :except => [:show, :edit] do
    get "requests", :on => :collection
    get "invites", :on => :collection
  end
end
