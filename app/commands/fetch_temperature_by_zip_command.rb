require 'open_weather'

class FetchTemperatureByZipCommand

  class << self
    def execute(city_comma_region)
      OpenWeather::Forecast.city(city_comma_region, default_options)
    end

    def default_options
      { units: 'Imperial', APPID: Rails.application.secrets.open_weather_map_key }
    end
  end
end