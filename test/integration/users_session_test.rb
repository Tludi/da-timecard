require 'test_helper'

class UsersSessionTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @user = users(:user1)
    @workday = @user.workdays.last

    # login_user(user = @user, route = login_url)
  end

  def login_user!
    visit login_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: 'password')
    click_button('Sign in')
  end

  test "check login path" do
    visit login_path
    assert page.has_content?("Login")
  end

  test "log in first user" do
    login_user!

    assert page.has_content?("Hours Worked Today")
  end


end
