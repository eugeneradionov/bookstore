require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { is_expected.to validate_presence_of(:card_number) }
  it { is_expected.to validate_presence_of(:mm_yy) }
  it { is_expected.to validate_presence_of(:cvv) }

  it { is_expected.to have_many(:orders) }
end
