class Api::V1::BackgroundsController < ApplicationController
  def show 
    if params[:location] == ' ' || params[:location] == ''
      render json: {error: "Can't find location or location was entered incorrectly", status: 404}, status: 404
    else 
      render json: ImageSerializer.new(UnsplashFacade.get_image(params[:location]))
    end 
  end 
end
