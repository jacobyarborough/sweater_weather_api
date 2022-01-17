class OpenWeatherService
  class << self
    def get_weather_forecast(lat, lng)
      response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely,alerts&units=imperial")
      parse_data(response)
    end 

    private 

    def conn 
      Faraday.new("https://api.openweathermap.org") do |x|
        x.params['appid'] = ENV['open_weather_api_key']
      end 
    end 

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: :true)
    end 
  end 
end 