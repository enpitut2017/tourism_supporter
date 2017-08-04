require 'test_helper'

class AdvicesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @spot = spots(:one)
  end

  test "should get new" do
    get new_spot_advice_url(spot_id: @spot.id)
    assert_response :success
  end

end
