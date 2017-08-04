require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @spot = spots(:one)
  end

  test "should get new" do
    get new_spot_map_path(spot_id: @spot.id)
    assert_response :success
  end

end
