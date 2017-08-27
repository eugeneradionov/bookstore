require 'rails_helper'

RSpec.describe ImageUrl, type: :model do
  it { is_expected.to have_and_belong_to_many(:books) }
  it { is_expected.to validate_presence_of(:url) }
end
