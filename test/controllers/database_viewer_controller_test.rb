require "test_helper"

class DatabaseViewerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get database_viewer_index_url
    assert_response :success
  end

  test "should get show" do
    get database_viewer_show_url
    assert_response :success
  end
end
