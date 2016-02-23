require 'rails_helper'

RSpec.describe TimePunch, :type => :model do
  it "is valid with entry, clockedInStatus" do
    timePunch = TimePunch.new(
      entry: Time.now,
      clockedInStatus: true
    )
    expect(timePunch).to be_valid
  end
end
