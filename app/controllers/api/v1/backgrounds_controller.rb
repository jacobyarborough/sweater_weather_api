class Api::V1::BackgroundsController < ApplicationController
  def show 
    UnsplashFacade.get_image(params[:location])
  end 
end
