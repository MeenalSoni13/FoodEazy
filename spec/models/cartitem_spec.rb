require 'rails_helper'

RSpec.describe Cartitem, type: :model do
  describe 'associations' do
    it "belongs to fooditems" do
      association = described_class.reflect_on_association(:fooditem)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to cart" do
      association = described_class.reflect_on_association(:cart)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

#  enum status: [:quantity]