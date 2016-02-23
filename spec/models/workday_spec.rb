require 'rails_helper'

# RSpec.describe Workday, :type => :model do
describe Workday do
  it "has a valid factory" do
    expect(build(:workday)).to be_valid
  end

  # it "belongs to a user" do
  #   build(:Workday)

  # end
end
