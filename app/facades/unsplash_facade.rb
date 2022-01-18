class UnsplashFacade
  class << self 
    def get_image(location)
      image_data = UnsplashService.get_background_image(location) 
    end 
  end 
end 