require 'rails_helper'

RSpec.describe MessageBoard, type: :model do
  it { is_expected.to have_many(:messages).dependent(:destroy) }
  it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:subscriptions) }

end
