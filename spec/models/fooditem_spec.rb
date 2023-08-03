require 'rails_helper'

RSpec.describe Fooditem, type: :model do
  describe 'associations' do
    it "has many cartitems" do
      association = described_class.reflect_on_association(:cartitems)
      expect(association.macro).to eq(:has_many)
    end

    it "belongs to restaurant" do
      association = described_class.reflect_on_association(:restaurant)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end




