require 'test_helper'

class PredictorControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get predictor_fetch_url
    assert_response :success
  end

  test "should get display" do
    post predictor_display_url, params: { city_comma_region: 'Alexandria, VA' }
    assert_response :success
  end

end
