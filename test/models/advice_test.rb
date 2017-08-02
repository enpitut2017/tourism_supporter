require 'test_helper'

class AdviceTest < ActiveSupport::TestCase
  def setup
    @spot = spots(:one)
   # @advice = @spot.advices.build(pictureURL: "a", comment: "aa")
    @advice = Advice.new(spot_id:@spot.id, pictureURL: "a", comment: "aa")
  end

  test "should be valid" do
    assert @advice.valid?
  end

  test "spot_id should be present" do
    @advice.spot_id = nil
    assert_not @advice.valid?
  end

  test "comment should be present" do
    @advice.comment = nil
    assert_not @advice.valid?
  end
end
