class UnsplashService
  class << self
    def get_background_image(location) 
      response = conn.get("/search/photos?page=1&query=#{location}&per_page=1")
      parse_data(response)
    end 

    private 

    def conn 
      Faraday.new("https://api.unsplash.com") do |x|
        x.params['client_id'] = ENV['unsplash_client_id']
      end 
    end 

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: :true)
    end 
  end 
end 