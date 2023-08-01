class CheckoutController < ApplicationController
 skip_before_action :verify_authenticity_token, only: :create

   def new 
    @user = User.find(current_user.id)
    @cartitem = @user.cartitems.find(params[:id]) 
   end   

   def create
    @user = User.find(current_user.id)
    @order = @user.orders.find(params[:id])
    card_detail = params[:stripeTokenType]

    amount = @booking.tour.amount * @booking.
  
 total_price += cart_item.fooditem.price * cart_item.quantity
         @session = Stripe::Checkout::Session.create({
         payment_method_types: ["card"],
         line_items: [{
         amount:fooditem.id,
         currency:"usd",
         quantity: 1,
         }],
        mode: 'payment',
        success_url:  root_url,
        cancel_url: root_url,
        })
        respond_to do |format|
          format.js  
  end    

end   
end    
