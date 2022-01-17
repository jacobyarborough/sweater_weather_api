class Api::V1::ForecastsController < ApplicationController
  def show 
    coordinates = MapquestFacade.get_location_details(params[:location])
    render json: OpenWeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
  end
end
