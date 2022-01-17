class Weather
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather_data)
    @id
    @type = 'forecast'
    @current_weather = current_weather_func(weather_data)
    @daily_weather = daily_weather_func(weather_data)
    @hourly_weather = hourly_weather_func(weather_data)
  end 

  def current_weather_func(data)
    current_weather_hash = {}
    current_weather_hash[:datetime] = data[:current][:dt]
    current_weather_hash[:sunrise] = data[:current][:sunrise]
    current_weather_hash[:sunset] = data[:current][:sunset]
    current_weather_hash[:temperature] = data[:current][:temp]
    current_weather_hash[:feels_like] = data[:current][:feels_like]
    current_weather_hash[:humidity] = data[:current][:humidity]
    current_weather_hash[:uvi] = data[:current][:uvi]
    current_weather_hash[:visibility] = data[:current][:visibility]
    current_weather_hash[:conditions] = data[:current][:weather][0][:description]
    current_weather_hash[:icon] = data[:current][:weather][0][:icon]
    current_weather_hash
  end 

  def daily_weather_func(data)
    daily_weather_array = []
    days = 0
    data[:daily].each do |day|
      if days <= 4
        day_hash = {}
        day_hash[:date] = day[:dt]
        day_hash[:sunrise] = day[:sunrise]
        day_hash[:sunset] = day[:sunset]
        day_hash[:max_temp] = day[:temp][:max]
        day_hash[:min_temp] = day[:temp][:min]
        day_hash[:conditions] = day[:weather][0][:description]
        day_hash[:icon] = day[:weather][0][:icon]
        daily_weather_array.push(day_hash)
        days += 1
      end 
    end
    daily_weather_array
  end 

  def hourly_weather_func(data)
    hourly_weather_array = []
    hours = 0
    data[:hourly].each do |hour|
      if hours <=7
        hour_hash = {}
        hour_hash[:time] = hour[:dt]
        hour_hash[:temperature] = hour[:temp]
        hour_hash[:conditions] = hour[:weather][0][:description]
        hour_hash[:icon] = hour[:weather][0][:icon]
        hourly_weather_array.push(hour_hash)
        hours += 1
      end 
    end
    hourly_weather_array
  end 
end