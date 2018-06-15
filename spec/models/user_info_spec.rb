require 'rails_helper'

RSpec.describe UserInfo, type: :model do
  it { is_expected.to belong_to(:shipping_address) }
  it { is_expected.to belong_to(:billing_address) }
  it { is_expected.to belong_to(:payment) }
  it { is_expected.to belong_to(:user) }
end
