require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "routes test" do
    get "/"
    assert_response :success
  end
end
