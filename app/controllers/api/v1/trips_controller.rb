class Api::V1::TripsController < ApplicationController
  def create
    travel = MapquestFacade.get_roadtrip(start_city, end_city)
    coordinates = MapquestFacade.get_location_details(end_city)
    forecast = OpenWeatherFacade.get_weather_at_time(coordinates[:lat], coordinates[:lng], travel.travel_info[:time])
    roadtrip = Roadtrip.new(travel, forecast)
  end
end 