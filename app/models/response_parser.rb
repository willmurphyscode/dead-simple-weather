class ResponseParser
  def initialize(response)
    @response = response
  end

  def predicted_temp
    Float(@response.dig('list', 0, 'main', 'temp'))
  end
end