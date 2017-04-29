require 'test_helper'

class TemperaturePredictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temperature_prediction = temperature_predictions(:one)
  end

  test "should get index" do
    get temperature_predictions_url
    assert_response :success
  end

  test "should get new" do
    get new_temperature_prediction_url
    assert_response :success
  end

  test "should create temperature_prediction" do
    assert_difference('TemperaturePrediction.count') do
      post temperature_predictions_url, params: { temperature_prediction: { date_covered: @temperature_prediction.date_covered, date_issued: @temperature_prediction.date_issued, temp: @temperature_prediction.temp, zip: @temperature_prediction.zip } }
    end

    assert_redirected_to temperature_prediction_url(TemperaturePrediction.last)
  end

  test "should show temperature_prediction" do
    get temperature_prediction_url(@temperature_prediction)
    assert_response :success
  end

  test "should get edit" do
    get edit_temperature_prediction_url(@temperature_prediction)
    assert_response :success
  end

  test "should update temperature_prediction" do
    patch temperature_prediction_url(@temperature_prediction), params: { temperature_prediction: { date_covered: @temperature_prediction.date_covered, date_issued: @temperature_prediction.date_issued, temp: @temperature_prediction.temp, zip: @temperature_prediction.zip } }
    assert_redirected_to temperature_prediction_url(@temperature_prediction)
  end

  test "should destroy temperature_prediction" do
    assert_difference('TemperaturePrediction.count', -1) do
      delete temperature_prediction_url(@temperature_prediction)
    end

    assert_redirected_to temperature_predictions_url
  end
end
