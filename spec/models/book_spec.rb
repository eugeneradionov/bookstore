require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :publication_year }
  it { is_expected.to validate_presence_of :height }
  it { is_expected.to validate_presence_of :width }
  it { is_expected.to validate_presence_of :depth }

  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to have_and_belong_to_many(:authors) }
  it { is_expected.to have_and_belong_to_many(:categories) }
  it { is_expected.to have_and_belong_to_many(:image_urls) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:order_items) }
end
