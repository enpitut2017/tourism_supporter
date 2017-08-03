require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @spot = spots(:one)
  end

  test "should get show" do
    get spot_path(@spot)
    assert_response :success
  end

end
