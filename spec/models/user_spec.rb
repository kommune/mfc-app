require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:birth_date) }
  it { is_expected.to validate_numericality_of(:postal_code).only_integer }
  it { is_expected.to define_enum_for(:gender).with([:male, :female]) }
  it { is_expected.to define_enum_for(:marital_status).with([:single, :married, :divorced, :widowed]) }
  it { is_expected.to define_enum_for(:children).with([:no, :yes]) }
  it { is_expected.to define_enum_for(:role).with([:user, :agency_user]) }

  describe 'Birth date validations' do
    it { is_expected.to allow_value(100.years.ago).for(:birth_date) }
    it { is_expected.not_to allow_value(100.days.from_now).for(:birth_date) }
  end

  it { is_expected.to have_many(:messages).dependent(:destroy) }
  it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
  it { is_expected.to have_many(:message_boards).through(:subscriptions) }
  it { is_expected.to belong_to(:agency) }

end
