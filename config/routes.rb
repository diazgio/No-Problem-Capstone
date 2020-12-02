Rails.application.routes.draw do
  devise_for :users, except: %i[index]
  devise_scope :users do
    authenticated :users do
      root 'problems#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users do
    resources :followings, only: %i[destroy]
  end
  s
  resources :problems do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end
end
