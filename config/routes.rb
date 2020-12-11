Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :index, :show, :destroy]
end
