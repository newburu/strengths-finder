require "test_helper"

class PortalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get portals_index_url
    assert_response :success
  end
end
