class Trip 
  attr_reader :travel_info
  
  def initialize(results, start_city, end_city)
    @travel_info = get_travel_info(results, start_city, end_city)
  end

  def get_travel_info(results, start_city, end_city)
    detail_hash = {}
    if results[:info][:messages][0] != "We are unable to route with the given locations."
      detail_hash = {}
      detail_hash[:start_city] = start_city 
      detail_hash[:end_city] = end_city 
      detail_hash[:time] = results[:route][:formattedTime]
      detail_hash 
    else 
      detail_hash = {}
      detail_hash[:start_city] = start_city 
      detail_hash[:end_city] = end_city 
      detail_hash[:time] = "Impossible Route"
      detail_hash 
    end
  end
end