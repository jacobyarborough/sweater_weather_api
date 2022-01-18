class UnsplashFacade
  class << self 
    def get_image(location)
      image_data = UnsplashService.get_background_image(location) 
      Image.new(image_data, location)
    end 
  end 
end 