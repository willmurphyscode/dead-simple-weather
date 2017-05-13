require 'open_weather'

# monkey patch

class OpenWeather::Forecast
  def self.foo
    true
  end
end

class FetchTemperatureByZipCommand

  ZIP_REGEX = /\d{5}/

  class << self
    def execute(city_comma_region)
      region = city_comma_region.strip
      return OpenWeather::Forecast.city(city_comma_region, default_options) unless ZIP_REGEX.match? region
      OpenWeather::Forecast.zip(region, default_options)
    end

    def default_options
      { units: 'Imperial', APPID: Rails.application.secrets.open_weather_map_key }
    end

    def patch_foo
      OpenWeather::Forecast.foo
    end
  end
end