require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email)}
  
  it 'should validate uniqueness of email' do
    admin = Admin.new(
      name: "Admin",
      email: "admin@blah.com"
    )
    expect(admin).to validate_uniqueness_of(:email).case_insensitive
  end
end
