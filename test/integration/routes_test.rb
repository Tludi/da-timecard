require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "routes test" do
    get "/"
    assert_response :success
  end

  test "Root should be home#index" do
    assert_routing '/', { controller: "home", action: "index"}
  end

  test "Root_path should be home#index" do
    assert_routing root_path, { controller: "home", action: "index"}
  end

end
