class Api::V1::BooksController < ApplicationController 
  def index 
    coordinates = MapquestFacade.get_location_details(params[:location])
    forecast = OpenWeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    books = LibraryFacade.get_books(params[:location], params[:quantity])
  end 
end 