class Order < ApplicationRecord
  belongs_to :user
  enum status: [:Pending, :Confirmed, :Rejected, :Cancelled]
  serialize :fooditem_ids, Array
end
