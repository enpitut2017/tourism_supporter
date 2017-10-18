require 'test_helper'

class SpotCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "invalid spot information" do
    log_in_as(@user)
    get new_spot_path
    picture = fixture_file_upload("#{Rails.root}/test/fixtures/test.jpg", 'image/jpg')
    assert_no_difference 'Spot.count' do
      post spots_path, params: { spot: { place_name:  "",
                                         lat: 0,
                                         lng: 0,
                                         picture:  picture} }
    end
    assert_template 'spots/new'
  end

  test "valid spot information" do
    log_in_as(@user)
    get new_spot_path
    picture = fixture_file_upload("#{Rails.root}/test/fixtures/test.jpg", 'image/jpg')
    p picture
    assert_difference 'Spot.count', 1 do
      post spots_path, params:  { spot: { place_name:  "a",
                                         lat: 0,
                                         lng: 0,
                                         picture: picture } }
    end
    follow_redirect!
    assert_template 'spots/show'
  end
end
