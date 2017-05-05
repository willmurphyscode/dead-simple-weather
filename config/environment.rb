# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

raise 'no api key' if Rails.application.secrets[:open_weather_map_key].nil? || Rails.application.secrets[:open_weather_map_key].blank?