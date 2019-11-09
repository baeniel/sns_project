Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users

  resources :relations do
    member do
      get :follow
      get :following_follower
    end
  end

end
