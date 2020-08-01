Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :questions do
    resources :answers
  end

  resources :relationships, only: [:create, :destroy]

  resources :users do
    member do
      resources :interests, only: [:create, :destroy]
    end
  end

  root to: "welcome#index"
end
