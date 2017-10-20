require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @spot = spots(:one)
  end

  test "should get show" do
    get spot_path(@spot)
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_spot_path(spot_id: @spot.id)
    assert_response :success
  end

  test "should not get new without login" do
    get new_spot_path(spot_id: @spot.id)
    assert_redirected_to controller: :sessions, action: :new
  end
end
