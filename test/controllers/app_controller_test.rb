require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get detail_path
    assert_response :success
  end

end
