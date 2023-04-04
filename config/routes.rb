Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :comments, only: [:create, :new]
    resources :likes, only: [:create, :destroy]
  end  
  
  devise_for :users
  root "site#index"

end
