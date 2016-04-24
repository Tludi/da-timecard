Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'dashboards#index'
    resources :accounts do
      resources :users
    end

    resources :users do
      resources :workdays
    end

    resources :dashboards

    resources :projects do
      member do
        patch :addUser
      end
      resources :users
    end
  end

  # resources :time_punches
  resources :user_sessions
  # resources :users
  # resources :projects
  # resources :dashboards
  resources :accounts, only: [:new, :create]
  get 'dashboard' => 'dashboards#index', as: :dashboard

  get 'user/:id' => 'users#show', as: :user

  get 'home' => 'home#index', :as => :home
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :workdays do
    resources :time_punches
  end

end
