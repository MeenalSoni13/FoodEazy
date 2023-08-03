class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one :cart
  has_many :orders
  after_create :set_cart
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  
  has_many :messages
  
  private
   
  def set_cart
     Cart.create(user_id: self.id)
  end
 end


