require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to belong_to(:delivery) }
  it { is_expected.to belong_to(:shipping_address) }
  it { is_expected.to belong_to(:billing_address) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:payment) }
  it { is_expected.to belong_to(:order_status) }
  it { is_expected.to have_many(:order_items) }

  context 'scope validations' do
    it 'should have :in_delivery scope' do
      expect(Order).to respond_to(:in_delivery)
    end

    it 'should have :delivered scope' do
      expect(Order).to respond_to(:delivered)
    end

    it 'should have :waiting_for_processing scope' do
      expect(Order).to respond_to(:waiting_for_processing)
    end

    it 'should have :in_progress scope' do
      expect(Order).to respond_to(:in_progress)
    end

    it 'should have :canceled scope' do
      expect(Order).to respond_to(:canceled)
    end

  end
end
