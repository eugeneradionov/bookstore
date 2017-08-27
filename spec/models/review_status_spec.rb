require 'rails_helper'

RSpec.describe ReviewStatus, type: :model do
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to validate_presence_of(:status) }
end
