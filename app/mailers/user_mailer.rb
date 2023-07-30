class UserMailer < ApplicationMailer
    def send_email(user, order)
     @user = user
     @order = order
     mail(to: @user, subject: 'Order has Successfully recieved #{@order.id}')
    end
  end