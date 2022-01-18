class WeatherBook
  attr_reader :id,
              :type,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(weather_info, books, location)
    @id
    @type = 'books'
    @destination = location
    @forecast = forecast_create(weather_info)
    @total_books_found = books[:numFound]
    @books = book_create(books)
  end 

  def forecast_create(weather_info)
    forecast_hash = {}
    forecast_hash[:summary] = weather_info.current_weather[:conditions]
    forecast_hash[:temperature] = "#{weather_info.current_weather[:temperature].round().to_i} F"
    forecast_hash
  end 

  def book_create(books)
    book_array = []
    books[:docs].each do |doc|
      book_hash = {}
      if doc[:isbn]
        book_hash[:isbn] = doc[:isbn]
      else 
        book_hash[:isbn] = ['No ISBN found']
      end 
      book_hash[:title] = doc[:title]
      book_hash[:publisher] = doc[:publisher]
      book_array.push(book_hash)
    end 
    book_array
  end
end