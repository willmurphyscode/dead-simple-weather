class PredictorController < ApplicationController

  def fetch

  end

  def display
    call_api
    populate_view
    render 'display'
  end

  private

  def call_api
    response = FetchTemperatureByZipCommand.execute location
    Rails.logger.debug response.to_json
    @parser = ResponseParser.new response
  end

  def populate_view
    @location = location
    @temp = @parser.predicted_temp
    @humidity = @parser.predicted_humidity
    @wind_speed = @parser.predicted_wind_speed
    @any_rain = @parser.any_rain?
    @adjective = DataToSentenceMapper.new(temp: @temp, humidity: @humidity, wind: @wind_speed, rain: @any_rain).adjective
    @article = %w(a e i o u).include?(@adjective[0]) ? 'an' : 'a'
  end
  
  def location
    params['city_comma_region']
  end
end
