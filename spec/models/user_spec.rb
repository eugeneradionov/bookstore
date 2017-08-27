require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }
  let(:user_pass_no_number) { FactoryGirl.build(:user, password: 'qwertyQwerty') }
  let(:user_pass_no_upper_letter) { FactoryGirl.build(:user, password: 'qwertyq123') }
  let(:user_short_pass) { FactoryGirl.build(:user, password: 'wertyQ1') }

  it { expect(user).to validate_presence_of :email }
  xit { expect(user).to validate_uniqueness_of :email } # TODO: fix validation
  it { expect(user).to validate_presence_of :password }
  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_one(:user_info) }
  it { is_expected.to have_one(:cart) }

  it 'does not save password without at least one number' do
    expect(user_pass_no_number).not_to be_valid
    user_pass_no_number.valid?
  end

  it 'does not save password without at least one uppercase letter' do
    expect(user_pass_no_upper_letter).not_to be_valid
    user_pass_no_upper_letter.valid?
  end

  it 'does not save password with password length < 8' do
    expect(user_short_pass).not_to be_valid
    user_short_pass.valid?
  end

  it 'save user with valid password' do
    expect(user).to be_valid
    user.valid?
  end
end
