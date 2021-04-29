Rails.application.routes.draw do
  get 'index/home'
  devise_for :users, :controllers => { registrations: 'registrations' }, skip: [:sessions]
  resources :yweets

  root to: "index#home"


  devise_scope :user do
    # sessions
    get    'login',  to: 'devise/sessions#new',     as: :new_user_session
    post   'login',  to: 'devise/sessions#create',  as: :user_session
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get 'yweets/:id/like', to:  "yweets#like", as: :like_yweet
  get 'yweets/:id/unlike', to: "yweets#unlike", as: :unlike_yweet
  get '/home', to: "yweets#index", as: :logged_in_root


  get '/search', to: "searchs#search", as: :search

  get 'users/:id/', to: "users#show", as: :get_user_profile
  get 'users/:id/follow', to: "users#follow", as: :follow_user
  
end
