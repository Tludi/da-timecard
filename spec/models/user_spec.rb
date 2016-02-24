require 'rails_helper'

# RSpec.describe User, :type => :model do
describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  # following test is redundant to testing factory - Just more expressive
  it "is valid with a firstName, lastName, email, pin, role, and password" do
    user = User.new(
      firstName: "Milo",
      lastName: "Bloom",
      email: "milo@email.com",
      pin: 1234,
      role: "Crew",
      password: "password",
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  it "is invalid without a firstName" do
    user = build(:user, firstName: nil)
    user.valid?
    expect(user.errors[:firstName]).to include("can't be blank")
  end

  it "is invalid without a lastName" do
    user = User.new(lastName: nil)
    user.valid?
    expect(user.errors[:lastName]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a password less than 5 characters" do
    user = User.new(password: "pass")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid without a pin number" do
    user = User.new(pin: nil)
    user.valid?
    expect(user.errors[:pin]).to include("can't be blank")
  end

  it "is invalid without a role" do
    user = User.new(role: nil)
    user.valid?
    expect(user.errors[:role]).to include("can't be blank")
  end

  it "is invalid without a pin of 4 digits" do
    user = User.new(pin: 123)
    user.valid?
    expect(user.errors[:pin]).to include("is the wrong length (should be 4 characters)")
  end

  it "is invalid with a duplicate email" do
    user = create(:user, email: "tester@email.com")
    user = build(:user, email: "tester@email.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns user's full name as a string" do
    user = build(:user, firstName: "Milo", lastName: "Bloom")
    expect(user.fullName).to eq 'Milo Bloom'
  end

  it "belongs to an account" do
    user = build(:user)
    expect(user.account).to_not eq nil
  end
end
