class MapquestService
  class << self
    def get_location(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
      parse_data(response)
    end 

    def get_roadtrip_details(start_city, end_city)
      response = conn.get("/directions/v2/route?from=#{start_city}&to=#{end_city}")
      parse_data(response)
    end

    private 

    def conn 
      Faraday.new("http://www.mapquestapi.com") do |x|
        x.params['key'] = ENV['mapquest_api_key']
      end 
    end 

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: :true)
    end 
  end 
end 