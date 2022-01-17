class OpenWeatherFacade
  class << self 
    def get_weather(lat, lng)
      weather_data = OpenWeatherService.get_weather_forecast(lat, lng)
      Weather.new(weather_data)
    end 
  end 
end 