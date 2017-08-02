require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  def setup
    @spot = Spot.new(placeName: "Example Spot", lat: 0, lng: 0)
  end

  test "should be valid" do
    assert @spot.valid?
  end

  test "placeName should be present" do
    @spot.placeName = ""
    assert_not @spot.valid?
  end

  test "lat should be present" do
    @spot.lat = nil
    assert_not @spot.valid?
  end

  test "lng should be present" do
    @spot.lng = ""
    assert_not @spot.valid?
  end

  test "placeName should be unique" do
    duplicate_user = @spot.dup
    @spot.save
    assert_not duplicate_user.valid?
  end
end
