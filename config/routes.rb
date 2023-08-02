Rails.application.routes.draw do
  resources :payments,only: [:create]
  post "payment/create", to: "checkout#create"
  resources :rooms do
    resources :messages
  end  
  # end  
  devise_for :users
  # devise_scope :users do
  
  
 resources :orders
 
  resources :cartitems do  
   resources :orders do
     get "/orders/confirmed"
     get "/orders/cancelled"
     get "/orders/rejected"
  end
end


  root "homes#index"


  resource :cart, only: [:show], as: "user_cart", path: "users/:user_id/cart"

  resources :cart do
    resources :cartitems do
      get :increase_quantity
      get :decrease_quantity
      get :remove_item
    end
  end

  resources :restaurants do
    resources :fooditems
  end
end
