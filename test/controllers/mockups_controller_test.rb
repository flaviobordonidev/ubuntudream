require "test_helper"

class MockupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mockups_index_url
    assert_response :success
  end
end
