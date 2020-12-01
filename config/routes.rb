Rails.application.routes.draw do
  devise_for :users, except: %i[index]
  resources :problems
  root 'problems#index'
end
