class ResponseParser
  def initialize(response)
    @response = response
  end

  def predicted_temp(list_ix = 0)
    Float(@response.dig('list', list_ix, 'main', 'temp'))
  end

  def predicted_humidity(list_ix = 0)
    Float(@response.dig('list', list_ix, 'main', 'humidity'))
  end

  def predicted_wind_speed(list_ix = 0)
    Float(@response.dig('list', list_ix, 'wind', 'speed'))
  end

  def their_prediction(list_ix = 0)
    @response.dig('list', list_ix, 'weather', 'main')
  end

  def any_rain?
    if @response['list']
      @response['list'].any? do |node|
          predicts_rain? node
        end
    else
      false
    end
  end

  def predicts_rain?(node)
    return false if node.nil?
    /rain/i =~ node.dig('weather', 0, 'main') || /rain/i =~ node.dig('weather', 0, 'description') ||
        node.keys.include?('rain')
  end

  def heavy_rain?
    if @response['list']
      @response['list'].any? do |node|
        heavy_rain_node?(node)
      end
    else
      false
    end
  end

  def heavy_rain_node?(node)
    /heavy intensity rain/i =~ node.dig('weather', 0, 'description')
  end

end
