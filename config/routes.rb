Rails.application.routes.draw do
  devise_for :users
  resources :yweets

  root to: "yweets#index"

  get 'yweets/:id/like', to:  "yweets#like", as: :like_yweet
  get 'yweets/:id/unlike', to: "yweets#unlike", as: :unlike_yweet
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
