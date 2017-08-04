require 'test_helper'

class AdvicesInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @spot = spots(:one)
  end

  test "advice interface" do
    comment = 'Test comment'
    picture = fixture_file_upload('test/fixtures/test.jpg', 'image/jpeg')
    assert_difference 'Advice.count', 1 do
      post spot_advices_path(spot_id: @spot.id), params: {
        advice: { comment: comment, picture: picture }
      }
    end
    assert assigns(:advice).picture?
    follow_redirect!
    assert_match comment, response.body
  end
end
