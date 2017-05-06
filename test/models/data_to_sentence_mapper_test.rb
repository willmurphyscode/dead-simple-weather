require 'test_helper'

class DataToSentenceMapperTest < ActiveSupport::TestCase
  def humid_response_parser_stub
    stub = Object.new
    stub.stubs(:predicted_humidity).returns(100.0)
    stub.stubs(:predicted_temp).returns(100.0)
    stub.stubs(:predicted_wind_speed).returns(0.0)
    stub
  end

  def cold_rainy_stub
    stub = Object.new
    stub.stubs(:predicted_wind_speed).returns(0.0)
  end

  test 'stubbing works' do
    assert humid_response_parser_stub.predicted_humidity == 100.0, 'foo'
  end


  test 'adjective returns muggy on a hot and humid day' do
    # subject = DataToSentenceMapper.new(temp: 100.0, humidity: 100.0, wind: 3.0, rain: false)
    subject = DataToSentenceMapper.new(humid_response_parser_stub)
    expected = 'muggy'
    actual = subject.adjective
    assert_equal expected, actual, 'Returned wrong adjective for muggy days'
  end

  test 'adjective returns cold and rainy on a cold, rainy day' do
    subject = DataToSentenceMapper.new(cold_rainy_stub)
    expected = 'cold and rainy'
    actual = subject.adjective
    assert_equal expected, actual, 'Returned wrong adjective for muggy days'
  end
end
