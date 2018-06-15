require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to(:book) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:review_status) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:text) }

  context 'scope validations' do
    it 'should have :approved scope' do
      expect(Review).to respond_to(:approved)
    end

    it 'should have :unprocessed scope' do
      expect(Review).to respond_to(:unprocessed)
    end

    it 'should have :rejected scope' do
      expect(Review).to respond_to(:rejected)
    end
  end
end
