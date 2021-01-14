Rails.application.routes.draw do
  resources :orders
  devise_for :users
  root to:"items#index"

  resources :items do
    resources :orders 
    
    
  end
end
