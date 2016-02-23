require 'rails_helper'

RSpec.describe Project, :type => :model do
  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  it "has an account" do
    project = build(:project)
    expect(project.account).to_not be nil
  end

  it "is invalid without a name" do
    project = build(:project, name: nil)
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

end
