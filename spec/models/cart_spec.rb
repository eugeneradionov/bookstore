require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to have_many(:order_items) }
end
