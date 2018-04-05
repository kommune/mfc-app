require 'rails_helper'

RSpec.describe AgenciesCategory, type: :model do
  it { is_expected.to belong_to(:agency) }
  it { is_expected.to belong_to(:category) }
end
