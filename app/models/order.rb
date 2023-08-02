class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
#   before_save : before_save :set_subtotal

#   def subtotal
#     cart_items.collect do |cart_item|
#       if cart_item.valid? && cart_item.fooditem_price.present? && cart_item.quantity.present?
#         cart_item.fooditem_price * cart_item.quantity.to_i
#       else
#         0
#       end
#     end.sum
#   end  

#   private

#   def set_subtotal
#     self[:subtotal] = subtotal
#   end
#  end
end
