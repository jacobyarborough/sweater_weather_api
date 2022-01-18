class Image 
    attr_reader :id,
                :type,
                :image 

  def initialize(image_data, location) 
    @id
    @type = 'image'
    @image = image_hash_create(image_data, location)
  end 

  def image_hash_create(image_data, location)
    image_hash = {}
    image_hash[:location] = location 
    image_hash[:image_url] = image_data[:results][0][:urls][:regular]
    image_hash[:credit] = {}
    image_hash[:credit][:source] = 'unsplash.com'
    image_hash[:credit][:author_link] = "#{image_data[:results][0][:user][:links][:html]}?utm_source=sweater_weather&utm_medium=referral"
    image_hash[:credit][:author_name] = image_data[:results][0][:user][:name]
    image_hash
  end 
end 