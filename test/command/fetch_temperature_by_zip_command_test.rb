require 'test_helper'

class FetchTemperatureByZipCommandTest < ActiveSupport::TestCase


  test '#execute' do
    response = FetchTemperatureByZipCommand.execute('22314')
    puts response['list']
    temp = Float(response.dig('list', 0, 'main', 'temp'))
    assert temp.instance_of?(Float), 'expected a float'

  end

end