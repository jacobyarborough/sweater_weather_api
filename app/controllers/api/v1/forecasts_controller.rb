class Api::V1::ForecastsController < ApplicationController
  def show 
    if params[:location] == ' ' || params[:location] == ''
      render json: {error: "Can't find location or location was entered incorrectly", status: 404}, status: 404
    else 
      coordinates = MapquestFacade.get_location_details(params[:location])
      forecast = OpenWeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
      render json: ForecastSerializer.new(forecast)
    end 
  end
end
