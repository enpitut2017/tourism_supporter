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

  test "should redirect destroy for wrong advice" do
    log_in_as(users(:ants))
    advice = advices(:two)
    assert_no_difference 'Advice.count' do
      delete advice_path(advice)
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy for correct advice" do
    log_in_as(@user)
    advice = advices(:two)
    assert_difference 'Advice.count', -1 do
      delete advice_path(advice)
    end
    assert_redirected_to controller: :spots, action: :show
  end

  test "should not destroy without login" do
    advice = advices(:one)
    assert_no_difference 'Advice.count' do
      delete advice_path(advice)
    end
    assert_redirected_to login_url
  end

  test "should redirect edit for wrong advice" do
    log_in_as(users(:ants))
    advice = advices(:one)
    spot = spots(:one)
    comment = "test"
    user = @user
    assert_no_difference 'Advice.count' do
      patch advice_path(advice), params: { one: { spot: spot,
                                                  comment: comment,
                                                  user: user } }
    end
    assert_redirected_to root_url
  end

  test "should redirect edit for correct advice" do
    log_in_as(@user)
    advice = advices(:one)
    spot = spots(:one)
    comment = "test"
    user = @user
    patch advice_path(advice), params: { advice: { spot: spot,
                                                   comment: comment,
                                                   user: user } }
    assert_redirected_to controller: :advices, action: :show
    advice.reload
    assert_equal spot, advice.spot
    assert_equal comment, advice.comment
    assert_equal user, advice.user
  end

  test "should not edit without login" do
    advice = advices(:one)
    spot = spots(:one)
    comment = "test"
    user = @user
    assert_no_difference 'Advice.count' do
      patch advice_path(advice), params: { one: { spot: spot,
                                                  comment: comment,
                                                  user: user } }
    end
    assert_redirected_to login_url
  end
end
