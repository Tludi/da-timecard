Rails.application.routes.draw do
  resources :work_sessions
  namespace :admin do
    get 'tasks/index'
  end

  resources :tasks
  root 'home#index'
  get 'home' => 'home#index', :as => :home
  get 'dashboard' => 'dashboards#index', as: :dashboard
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
  get 'user/:id' => 'users#show', as: :user

  resources :user_sessions
  resources :accounts, only: [:new, :create]
  
  resources :workdays, only: [:index, :show, :new, :create, :update] do
    resources :time_punches
  end
  
  namespace :admin do
    root 'dashboards#index'
    resources :accounts do
      resources :users
    end

    resources :roles

    resources :workdays
    
    resources :tasks

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

  #remove the following route in production
  resources :time_punches


  # resources :users
  # resources :projects
  # resources :dashboards

end
