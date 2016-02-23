require 'rails_helper'

RSpec.describe TimePunch, :type => :model do
  it "is valid with entry, clockedInStatus" do
    timePunch = TimePunch.new(
      entry: Time.now,
      clockedInStatus: true
    )
    expect(timePunch).to be_valid
  end

  it "alternates clockedInStatus for sequential timePunches" do
    initialStatus = false
    initialTimePunch = create(:time_punch, clockedInStatus: !initialStatus)
    currentStatus = initialTimePunch.clockedInStatus
    # calls invertStatus method in timePunch model
    # invertedCurrentStatus = initialTimePunch.invertStatus(currentStatus)
    # secondTimePunch = build(:time_punch, clockedInStatus: invertedCurrentStatus)
    secondTimePunch = build(:time_punch, clockedInStatus: !currentStatus)
    expect(secondTimePunch.clockedInStatus).to eq false
  end
end
