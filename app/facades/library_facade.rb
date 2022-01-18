class LibraryFacade
  class << self 
    def get_books(location, quantity)
      LibraryService.get_location_books(location, quantity) 
    end 
  end 
end 