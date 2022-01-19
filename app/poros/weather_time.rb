class WeatherTime
  attr_reader :weather_at_eta,
              :time

  def initialize(weather_data, time)
    @time = new_time(time)
    @weather_at_eta = future_weather(weather_data)
  end

  def new_time(time)
    if time == "Impossible Route"
      time 
    else 
      split_time = time.split(":")
      rounded_minutes = (split_time[1].to_f + (split_time[2].to_f/60)).round
      rounded_hours = (split_time[0].to_f + (rounded_minutes.to_f/60)).round()
      rounded_hours
    end
  end

  def future_weather(weather_data)
    weather_hash = {}
    if @time == "Impossible Route"
      weather_hash
    elsif @time > 48 
      weather_hash[:temperature] = "Forecast not yet available"
      weather_hash[:conditions] = "Forecast not yet available"
      weather_hash
    else 
      weather_hash[:temperature] = weather_data[:hourly][@time-1][:temp].to_f
      weather_hash[:conditions] = weather_data[:hourly][@time-1][:weather][0][:description].to_s
      weather_hash
    end 
  end
end 