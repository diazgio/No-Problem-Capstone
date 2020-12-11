Rails.application.routes.draw do
  resources :categories, only: %i[index create new]
  devise_for :users
  root 'problems#index'

  resources :users, only: %i[show index]
  resources :followings, only: %i[destroy]

  get 'following/:id', to: 'followings#create', as: 'follow'
  resources :problems do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
end
