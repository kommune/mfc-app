require 'rails_helper'

RSpec.describe Agency, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to define_enum_for(:area).with([:north, :south, :east, :west, :central, :no_boundary]) }
  it { is_expected.to have_one(:user).dependent(:destroy) }
  it { is_expected.to have_many(:agencies_categories).dependent(:destroy) }
end
