Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations'}

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
