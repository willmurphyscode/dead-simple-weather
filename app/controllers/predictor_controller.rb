class PredictorController < ApplicationController
  def fetch

  end

  def display
    city_comma_region = params['city_comma_region']
    Rails.logger.debug params.inspect
    response = FetchTemperatureByZipCommand.execute city_comma_region
    Rails.logger.debug response
    @temp = Float(response.dig('list', 0, 'main', 'temp'))
    @zip = city_comma_region
    render 'display'
  end
end
