require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  it { is_expected.to have_many(:orders) }
end
