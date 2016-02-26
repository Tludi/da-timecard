require 'rails_helper'

RSpec.describe Account, :type => :model do
  it "is valid with a name, time zone" do
    account = Account.new(
      name: "diligent agility",
      time_zone: "Eastern Time (US & Canada)"
    )
    expect(account).to be_valid
  end

  it "invalid without a name" do
    account = build(:invalid_account)
    account.valid?
    expect(account.errors[:name]).to include("can't be blank")
  end

  it "has a valid time_zone" do
    account = create(:account)
    account.valid?
  end
end
