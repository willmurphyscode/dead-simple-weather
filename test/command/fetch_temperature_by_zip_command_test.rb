require 'test_helper'

class FetchTemperatureByZipCommandTest < ActiveSupport::TestCase

  test '#execute' do
    response = FetchTemperatureByZipCommand.execute('Alexandria, VA')
    temp = Float(response.dig('list', 0, 'main', 'temp'))
    assert temp.instance_of?(Float), 'expected a float'
  end

  test '#execute with a zip' do
    response = FetchTemperatureByZipCommand.execute('22314')
    temp = Float(response.dig('list', 0, 'main', 'temp'))
    assert temp.instance_of?(Float), 'expected a float'
  end

  test '#patch_foo' do
    assert FetchTemperatureByZipCommand.patch_foo, 'failed to patch'
  end



end