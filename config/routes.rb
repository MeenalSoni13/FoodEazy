Rails.application.routes.draw do

  resources :payments,only: [:create]
  post "payment/create", to: "checkout#create"

  resources :rooms do
    resources :messages
  end  
  
  devise_for :users
  resources :orders

#   resources :cartitems do  
#    resources :orders do
#   end
# end


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
