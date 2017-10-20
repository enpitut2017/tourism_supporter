require 'test_helper'

class AdvicesInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @spot = spots(:one)
  end

  test "advice interface" do
    log_in_as(@user)
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

    advice = advices(:two)
    assert_difference 'Advice.count', -1 do
      delete advice_path(advice)
    end

    get user_path(users(:michael))
    assert_select 'a', text: 'delete', count: 0
  end
end
