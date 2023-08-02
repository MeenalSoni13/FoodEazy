class Cart < ApplicationRecord
  belongs_to :user
  has_many :cartitems
  validates :user_id, presence: true
end
