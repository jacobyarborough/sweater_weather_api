class MapquestFacade 
  class << self 
    def get_location_details(location)
      results = MapquestService.get_location(location)
      lat_long = {}
      lat_long[:lat] = results[:results][0][:locations][0][:latLng][:lat]
      lat_long[:lng] = results[:results][0][:locations][0][:latLng][:lng]
      lat_long
    end 
  end 
end 