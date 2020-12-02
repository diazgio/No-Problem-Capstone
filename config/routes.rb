Rails.application.routes.draw do
  devise_for :users
  root 'problems#index'

  resources :users do
    resources :followings, only: %i[destroy]
  end
  get 'following/:id', to: 'followings#create', as: 'follow'
  resources :problems do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
end
