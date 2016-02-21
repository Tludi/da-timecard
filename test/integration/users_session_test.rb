require 'test_helper'

class UsersSessionTest < ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @crewUser = users(:user1)
    @adminUser = users(:user2)
    # @workday = @crewUser.workdays.last

    # login_user(user = @user, route = login_url)
  end

  def login_user(user)
    visit login_path
    fill_in('Email', with: user.email)
    fill_in('Password', with: 'password')
    click_button('Sign in')
  end

  test "check login path" do
    visit login_path
    assert page.has_content?("Login")
  end


  test "log in user with role of Crew" do
    login_user(@crewUser)
    # successful login creates a new workday for today if not exists
    @workday = @crewUser.workdays.last

    assert page.has_content?("Hours Worked Today")
    assert_equal "/workdays/#{@workday.id}", current_path, msg = "path does not match"

  end

  test "log in user with role of Admin" do
    login_user(@adminUser)

    assert page.has_content?("Admin Dashboard")
    assert_equal "/admin", current_path, msg = "path does not match"
  end

end
