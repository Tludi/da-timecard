require 'test_helper'
#
class UsersControllerTest < ActionController::TestCase
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


#
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:users)
#   end
#
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
#
#   test "should create user" do
#     assert_difference('User.count') do
#       post :create, user: { firstName: @user.firstName, lastName: @user.lastName }
#     end
#
#     assert_redirected_to user_path(assigns(:user))
#   end
#
#   test "should show user" do
#     get :show, id: @user
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get :edit, id: @user
#     assert_response :success
#   end
#
#   test "should update user" do
#     patch :update, id: @user, user: { firstName: @user.firstName, lastName: @user.lastName }
#     assert_redirected_to user_path(assigns(:user))
#   end
#
#   test "should destroy user" do
#     assert_difference('User.count', -1) do
#       delete :destroy, id: @user
#     end
#
#     assert_redirected_to users_path
#   end
end
