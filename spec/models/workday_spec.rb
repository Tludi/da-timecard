require 'rails_helper'

# RSpec.describe Workday, :type => :model do
describe Workday do
  it "has a valid factory" do
    expect(build(:workday)).to be_valid
  end

  it "is valid with a dayDate, hoursWorked, notes" do
    workday = Workday.new(
      hoursWorked: 0.0,
      dayDate: Date.today,
      notes: "Note for today"
    )
    expect(workday).to be_valid
  end

  it "belongs to a user" do
    workday = build(:workday)
    expect(workday.user).to_not eq nil
  end

  it "is invalid without a date" do
    workday = build(:workday, dayDate: nil)
    workday.valid?
    expect(workday.errors[:dayDate]).to include("can't be blank")
  end

  it "has todays local date when creating a new workday"
end
