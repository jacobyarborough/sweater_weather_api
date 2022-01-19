class OpenWeatherFacade
  class << self 
    def get_weather(lat, lng)
      weather_data = OpenWeatherService.get_weather_forecast(lat, lng)
      Weather.new(weather_data)
    end 

    def get_weather_at_time(lat, lng, time)
      weather_data = OpenWeatherService.get_weather_forecast(lat, lng)
      WeatherTime.new(weather_data, time)
    end
  end 
end 