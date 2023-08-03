require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it "has many orders" do
      association = described_class.reflect_on_association(:orders)
      expect(association.macro).to eq(:has_many)
    end

    it "has many messages" do
      association = described_class.reflect_on_association(:messages)
      expect(association.macro).to eq(:has_many)
    end

    it "has one cart" do
      association = described_class.reflect_on_association(:cart)
      expect(association.macro).to eq(:has_one)
    end
  end

  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(
        email: "sejal@gmail.com",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end
  end

  # describe 'callbacks' do
  #   it 'creates a cart after user creation' do
  #     user = User.create(email: 'test@example.com', password: 'password')
  #     expect(user.cart).to be_present
  #   end

  #   it 'broadcasts after user creation' do
  #     expect(User).to receive(:broadcast_append_to).with('users')
  #     User.create(email: 'test@example.com', password: 'password')
  #   end
  # end

  # describe 'scopes' do
  #   it 'excludes the specified user' do
  #     user1 = User.create(email: 'user1@example.com', password: 'password')
  #     user2 = User.create(email: 'user2@example.com', password: 'password1')

  #     result = User.all_except(user1)

  #     expect(result).to include(user2)
  #     expect(result).not_to include(user1)
  #   end
  # end

  # describe 'private methods' do
  #   it 'sets a cart with the user ID' do
  #     user = User.new(email: 'test@example.com', password: 'password')
  #     user.send(:set_cart)
  #     expect(user.cart).to be_present
  #     expect(user.cart.user_id).to eq(user.id)
  #   end
  # end
end
