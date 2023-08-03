require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to room" do
      association = described_class.reflect_on_association(:room)
      expect(association.macro).to eq(:belongs_to)
    end
  end  
end



# belongs_to :user
# belongs_to :room
# after_create_commit { broadcast_append_to room }