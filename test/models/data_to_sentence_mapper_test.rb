require 'test_helper'

class DataToSentenceMapperTest < ActiveSupport::TestCase
  test 'adjective returns muggy on a hot and humid day' do
    subject = DataToSentenceMapper.new(temp: 100.0, humidity: 100.0, wind: 3.0, rain: false)
    expected = 'muggy'
    actual = subject.adjective
    assert_equal expected, actual, 'Returned wrong adjective for muggy days'
  end

  test 'adjective returns cold and rainy on a cold, rainy day' do
    subject = DataToSentenceMapper.new(temp: 40.0, humidity: 100.0, wind: 3.0, rain: true)
    expected = 'cold and rainy'
    actual = subject.adjective
    assert_equal expected, actual, 'Returned wrong adjective for muggy days'
  end
end