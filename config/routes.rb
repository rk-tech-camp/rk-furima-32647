Rails.application.routes.draw do
  resources :orders
  devise_for :users
  root to:"items#index"

  resources :items do
    resources :orders do
      resources :addresses
    end  
  end
end
