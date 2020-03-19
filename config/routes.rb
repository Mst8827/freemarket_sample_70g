Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'locations', to: 'users/registrations#new_location'
    post 'locations', to: 'users/registrations#create_location'
  end
  
  root "items#index"
  resources :items do
    member do
      get :confirm
    end
    collection do
      get :done
      get :category_children
      get :category_grandchildren
    end
    resources :comments, only: :create
    resources :images, only: [:index,:create]
  end
  resources :users, only: [:show] do
    collection do
      get :onsale
    end
    resources :profile, only: :index
    resources :creditcards, only: :index
    resources :location, only: :index
  end
  resources :creditcards, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end
  resources :purchases, only: [:index] do
    member do
      get 'index', to: 'purchases#index'
      get 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end
  resources :categories, only: [:show]
end