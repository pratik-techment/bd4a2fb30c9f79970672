Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :questions do
    resources :answers
  end

  root to: "welcome#index"
end
