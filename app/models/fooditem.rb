class Fooditem < ApplicationRecord
   belongs_to :restaurant
   has_many :cartitems
end
