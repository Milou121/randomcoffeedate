Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
end
