require 'test_helper'

class AdvicesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @spot = spots(:one)
  end

  test "should get new" do
    log_in_as(@user)
    get new_spot_advice_url(spot_id: @spot.id)
    assert_response :success
  end

  test "should not get new without login" do
    get new_spot_advice_url(spot_id: @spot.id)
    assert_redirected_to controller: :sessions, action: :new
  end
end
