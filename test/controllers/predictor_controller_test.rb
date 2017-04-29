require 'test_helper'

class PredictorControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get predictor_fetch_url
    assert_response :success
  end

  test "should get display" do
    get predictor_display_url
    assert_response :success
  end

end
