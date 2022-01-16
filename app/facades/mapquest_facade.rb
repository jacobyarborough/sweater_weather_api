class MapquestFacade 
  class << self 
    def get_location_details(location)
      binding.pry
      MapquestService.get_location(location)
    end 
  end 
end 