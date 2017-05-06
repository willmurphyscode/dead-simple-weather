class DataToSentenceMapper

  def initialize(response_parser)
    @parser = response_parser
    @temp = @parser.predicted_temp
    @humidity = @parser.predicted_humidity
    @wind_speed = @parser.predicted_wind_speed
    @any_rain = @parser.any_rain?
  end

  def adjective
    return 'muggy' if hot? && humid?
    return 'hot and dry' if hot? && !humid?
    return 'hot and windy' if hot? && windy?
    return 'cold and rainy' if chilly? && rain?
    return 'humid' if humid? && !hot? && !chilly?
    return 'damp and chilly' if humid? && chilly?
    return 'cool' if !hot? && !humid? && !chilly?
    return 'windy' if windy?
    'strange'
  end

  def windy?
    @wind >= 10.0
  end
  
  def hot?
    @temp >= 80.0
  end

  def humid?
    @humidity >= 75.0
  end

  def chilly?
    @temp <= 50.0
  end

  def rain?
    @any_rain
  end

  def heavy_rain?
    @parser.heavy_rain?
  end
end