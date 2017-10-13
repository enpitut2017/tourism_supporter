require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  def setup
    @spot = Spot.new(place_name: "Example Spot", lat: 0, lng: 0, picture: open("#{Rails.root}/test/fixtures/test.jpg"))
  end

  test "should be valid" do
    assert @spot.valid?
  end

  test "place_name should be present" do
    @spot.place_name = ""
    assert_not @spot.valid?
  end

  test "lat should be present" do
    @spot.lat = nil
    assert_not @spot.valid?
  end

  test "lng should be present" do
    @spot.lng = nil
    assert_not @spot.valid?
  end

   test "picture should be present" do
    @spot.picture = ""
    assert_not @spot.valid?
  end

  test "place_name should be unique" do
    duplicate_user = @spot.dup
    @spot.save
    assert_not duplicate_user.valid?
  end
end
