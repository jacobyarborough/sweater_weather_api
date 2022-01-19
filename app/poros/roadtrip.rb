class Roadtrip 
  attr_reader :id,
              :type,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta
  
  def initialize(travel, forecast)
    @id 
    @type = "roadtrip"
    @start_city = travel.travel_info[:start_city]
    @end_city = travel.travel_info[:end_city]
    @travel_time = time_formatter(travel.travel_info[:time])
    @weather_at_eta = forecast.weather_at_eta
  end

  def time_formatter(time)
    if time == "Impossible Route"
      time 
    else 
      split_time = time.split(":")
      "#{split_time[0].to_i} hour(s) " + "and " + "#{split_time[1].to_i} minutes"
    end
  end 
end