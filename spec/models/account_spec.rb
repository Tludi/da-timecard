require 'rails_helper'

RSpec.describe Account, :type => :model do
  it "is valid with a name, time zone" do
    account = Account.new(
      name: "diligent agility",
      time_zone: "Eastern Time (US & Canada)"
    )
    expect(account).to be_valid
  end

  it "has a valid time_zone" do
    account = create(:account)
    account.valid?
  end
end
