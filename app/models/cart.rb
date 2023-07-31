class Cart < ApplicationRecord
    belongs_to :user
    has_many :cartitems
    has_many :payments
    validates :user_id, presence: true
end
