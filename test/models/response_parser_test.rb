require 'test_helper'
require 'json'

class ResponseParserTest < ActiveSupport::TestCase
  MOCK_FILE = 'test/fixtures/files/open_weather_response.json'

  def hash_from_json_file(path)
    json = File.read(path)
    JSON.parse(json)
  end

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

  test 'it understands about heavy rain' do
    path = 'test/fixtures/files/rainy_in_alexandria.json'
    parser = ResponseParser.new(hash_from_json_file(path))
    assert parser.heavy_rain?, 'failed to detect heavy rain'
  end

  test 'it understands when there is not heavy rain' do
    path = 'test/fixtures/files/dry_city.json'
    parser = ResponseParser.new(hash_from_json_file(path))
    refute parser.heavy_rain?, 'it thinks it is raining when it is not raining'
  end
end