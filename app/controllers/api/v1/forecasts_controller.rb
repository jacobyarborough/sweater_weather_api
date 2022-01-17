class Api::V1::ForecastsController < ApplicationController
  def show 
    coordinates = MapquestFacade.get_location_details(params[:location])
    forecast = OpenWeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    render json: ForecastSerializer.new(forecast)
  end
end
