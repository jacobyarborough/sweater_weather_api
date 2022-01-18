class Api::V1::BooksController < ApplicationController 
  def index 
    coordinates = MapquestFacade.get_location_details(params[:location])
    weather_data = OpenWeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    books = LibraryFacade.get_books(params[:location], params[:quantity])
    weather_books = WeatherBook.new(weather_data, books, params[:location])
    render json: BookSerializer.new(weather_books)
  end 
end 