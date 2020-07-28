Rails.application.routes.draw do
  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
  end

  get 'welcome/index'

  resources :questions do
    resources :answers
  end

  resources :relationships, only: [:create, :destroy]

  root to: "welcome#index"
end
