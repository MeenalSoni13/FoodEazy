require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'associations' do
    it "has many fooditems" do
      association = described_class.reflect_on_association(:fooditems)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end

  describe "validations" do
    it "is valid with valid attributes" do
      restaurant = Restaurant.new(
        name: "first",
        description: "xyz",
        address: "vijay nagar"
      )
      expect(restaurant).to be_valid
    end

    it "is not valid with non-unique name" do
      restaurant1 = Restaurant.create(name: "first")
      restaurant2 = Restaurant.new(name: "first")
      expect(restaurant2).not_to be_valid
    end
  end
end