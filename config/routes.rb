Rails.application.routes.draw do
  root 'users#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # ゲストログインのパス作成
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update ,:index] do
    member do
     get :following, :followers #フォロー一覧・フォロワー一覧
    end

    collection do
    get :favorites #users/favorites
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :records


  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
