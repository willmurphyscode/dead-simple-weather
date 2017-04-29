require 'test_helper'
require 'json'

class ResponseParserTest < ActiveSupport::TestCase
  MOCK_FILE = 'test/fixtures/files/open_weather_response.json'
  test '#predicted_temp' do
    json_string = File.read(MOCK_FILE)
    response_hash = JSON.parse json_string
    parser = ResponseParser.new response_hash
    expected = 83.93
    actual = parser.predicted_temp
    assert_equal expected, actual, 'Failed to parse sample forecast json'
  end

  test '#any_rain?' do
    json_string = File.read('test/fixtures/files/chicago_weather_response.json')
    response_hash = JSON.parse json_string
    parser = ResponseParser.new response_hash
    assert parser.any_rain?, 'Failed to predict rain in Chicago'
  end
end