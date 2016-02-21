require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @user = users(:user1)
    @workday = @user.workdays.last

    # login_user(user = @user, route = login_url)
  end

  test "should get workday" do
    assert_routing workday_path(@workday), {controller: "workdays", action: "show", id: @workday.id.to_s}
  end

  test "should get workdays" do
    assert_routing workdays_path, {controller: "workdays", action: "index"}
  end



end
