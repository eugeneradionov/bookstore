require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it { is_expected.to validate_presence_of(:active) }
  it { is_expected.to validate_presence_of(:discount) }
  it { is_expected.to validate_uniqueness_of(:code) }
end
