class Api::V1::TripsController < ApplicationController
  before_action :verify_user, only: [:create]

  def create
    travel = MapquestFacade.get_roadtrip(user_params[:origin], user_params[:destination])
    coordinates = MapquestFacade.get_location_details(user_params[:destination])
    forecast = OpenWeatherFacade.get_weather_at_time(coordinates[:lat], coordinates[:lng], travel.travel_info[:time])
    binding.pry
    roadtrip = Roadtrip.new(travel, forecast)
  end

  private 

  def user_params
    JSON.parse(request.body.string, symbolize_names: :true)
  end 

  def verify_user
    if !User.find_by(api_key: user_params[:api_key])
      render json: {error: "Missing or Unauthorized API Key", status: 401}, status: 401
    end 
  end 
end 