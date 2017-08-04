require 'test_helper'

class AdviceTest < ActiveSupport::TestCase
  def setup
    @spot = spots(:one)
    @advice = @spot.advices.build(
      picture: open('test/fixtures/test.jpg'),
      comment: "Example Comment")
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

  test "advice should not be too long" do
    @advice.comment = "a" * 256
    assert_not @advice.valid?
  end


end
