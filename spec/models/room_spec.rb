require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'associations' do
    it "has_many messages" do
      association = described_class.reflect_on_association(:messages)
      expect(association.macro).to eq(:has_many)
    end
  end
end



# validates_uniqueness_of :name
#  scope :public_rooms, -> { where(is_private: false) }
#  after_create_commit { broadcast_append_to 'rooms' }