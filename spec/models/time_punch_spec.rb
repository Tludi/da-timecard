require 'rails_helper'

RSpec.describe TimePunch, :type => :model do
  it "is valid with entry, clockedInStatus" do
    timePunch = TimePunch.new(
      entry: Time.now,
      clockedInStatus: true
    )
    expect(timePunch).to be_valid
  end

  it "is invalid when clockedInStatus is nil" do
    timePunch = build(:time_punch, clockedInStatus: nil)
    timePunch.valid?
    expect(timePunch.errors[:clockedInStatus]).to include("can't be blank")
  end

  it "is invalid when entry is nil" do
    timePunch = build(:time_punch, entry: nil)
    timePunch.valid?
    expect(timePunch.errors[:entry]).to include("can't be blank")
  end

end
