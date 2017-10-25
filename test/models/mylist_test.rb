require 'test_helper'

class MylistTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @spot = spots(:one)
    @mylist = Mylist.new(spot_id: @spot.id, user_id: @user.id)
  end

  test "should be valid" do
    assert @mylist.valid?
  end

  test "user id should be present" do
    @mylist.user_id = nil
    assert_not @mylist.valid?
  end

  test "spot id should be present" do
    @mylist.spot_id = nil
    assert_not @mylist.valid?
  end
end
