require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get app_detail_url
    assert_response :success
  end

end
