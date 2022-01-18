require 'rails_helper'

RSpec.describe WeatherBook do
  let(:location) { "Denver, CO" }
  let(:weather_books) { WeatherBook.new(forecast, books, location) }

  it 'has attributes' do 
    expect(weather_books.id).to eq(nil)
    expect(weather_books.type).to eq('books')

    expect(weather_books.destination).to eq("Denver, CO")
    expect(weather_books.forecast).to be_a(Hash)
    expect(weather_books.forecast.count).to eq(2)
    expect(weather_books.forecast[:summary]).to eq("overcast clouds")
    expect(weather_books.forecast[:temperature]).to eq("45 F")
    expect(weather_books.total_books_found).to eq(35)
    expect(weather_books.books).to be_an(Array)
    expect(weather_books.books[1][:isbn]).to eq(["9780762507849", "0762507845"])
    expect(weather_books.books[1][:title]).to eq("Denver, Co")
    expect(weather_books.books[1][:publisher]).to eq(["Universal Map Enterprises"])
  end 
end 