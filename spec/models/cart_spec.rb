require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it "belongs to orders" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many cartitems" do
      association = described_class.reflect_on_association(:cartitems)
      expect(association.macro).to eq(:has_many)
    end
  end
  # describe "validations" do
  #   it "is valid with valid attributes" do
  #     cart = Cart.new(
  #       user_id: 1
  #     )
  #     expect(cart).not_to be_valid
  #     expect(cart.errors[:user_id]).to include("can't be blank")
  #   end
  # end
end


# belongs_to :user
# has_many :cartitems
# validates :user_id, presence: true

# it "is not valid without a username" do
#   user = User.new(name: "John Doe")
#   expect(user).not_to be_valid
#   expect(user.errors[:username]).to include("can't be blank")
# end
