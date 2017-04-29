class DataToSentenceMapper

  def initialize(temp:, humidity:, wind:, rain:)
    @temp = temp
    @humidity = humidity
    @wind = wind
    @rain = rain
  end

  def adjective
    return 'muggy' if hot? && humid?
    return 'hot and dry' if hot? && !humid?
    return 'hot and windy' if hot? && windy?
    return 'cold and rainy' if chilly? && rain?
    return 'humid' if humid? && !hot? && !chilly?
    return 'damp and chilly' if humid? && chilly?
    return 'cool' if !hot? && !humid? && !chilly?
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
    @rain
  end
end