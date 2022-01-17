class OpenWeatherFacade
  class << self 
    def get_weather(lat, lng)
      binding.pry
      OpenWeatherService.get_weather_forecast(lat, lng)
    end 
  end 
end 