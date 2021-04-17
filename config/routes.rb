Rails.application.routes.draw do
  devise_for :users
  resources :yweets

  root to: "yweets#index"

  get 'yweets/:id/like', to:  "yweets#like", as: :like_yweet
  get 'yweets/:id/unlike', to: "yweets#unlike", as: :unlike_yweet

  get 'users/:id/', to: "users#show", as: :get_user_profile
  get 'users/:id/follow', to: "users#follow", as: :follow_user
  
end
