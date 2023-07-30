class Restaurant < ApplicationRecord
    has_many  :fooditems, dependent: :destroy
    # validates :name, :address, presence: true
    # validates :name, uniqueness: true
end
