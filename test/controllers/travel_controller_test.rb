require "test_helper"

class TravelControllerTest < ActionDispatch::IntegrationTest
  test "should get location" do
    get travel_location_url
    assert_response :success
  end
end
