class Api::V1::ForecastsController < ApplicationController
  def show 
    MapquestFacade.get_location_details(params[:location])
  end
end
