class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  # enum status: [:Pending, :Confirmed, :Rejected, :Cancelled]
  serialize :fooditem_ids, Array
end
