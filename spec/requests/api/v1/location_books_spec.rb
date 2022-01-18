require 'rails_helper'

RSpec.describe 'Location Books', type: :request do 
  let(:location) { 'denver, co' }
  let(:quantity) { 5 }
  describe 'GET /book-search' do 
    before { get "/api/v1/book-search?location=#{location}&quantity=#{quantity}" }

    it 'returns books on location and current weather' do 
      book_weather = JSON.parse(response.body, symbolize_names: :true)[:data]

      expect(book_weather).not_to be_empty
      expect(book_weather[:id]).to eq(nil)
      expect(book_weather[:type]).to eq('books')
      expect(book_weather[:attributes]).to be_a(Hash)
      expect(book_weather[:attributes].count).to eq(4)

      expect(book_weather[:attributes]).to have_key(:destination)
      expect(book_weather[:attributes][:destination]).to be_a(String)
      expect(book_weather[:attributes]).to have_key(:forecast)
      expect(book_weather[:attributes][:forecast]).to be_a(Hash)
      expect(book_weather[:attributes][:forecast]).to have_key(:summary)
      expect(book_weather[:attributes][:forecast][:summary]).to be_a(String)
      expect(book_weather[:attributes][:forecast]).to have_key(:temperature)
      expect(book_weather[:attributes][:forecast][:temperature]).to be_a(String)
      expect(book_weather[:attributes]).to have_key(:total_books_found)
      expect(book_weather[:attributes][:total_books_found]).to be_an(Integer)

      expect(book_weather[:attributes]).to have_key(:books)
      expect(book_weather[:attributes][:books]).to be_an(Array)
      expect(book_weather[:attributes][:books].count).to eq(5)
      book_weather[:attributes][:books].each do |book|
        expect(book).to be_a(Hash)
        expect(book.count).to eq(3)
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_an(Array)
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_an(Array)
      end 
    end 
  end
end 