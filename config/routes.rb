Rails.application.routes.draw do
  devise_for :users
  root 'problems#index'

  resources :users
  resources :followings, only: %i[destroy]

  get 'following/:id', to: 'followings#create', as: 'follow'
  resources :problems do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
end
