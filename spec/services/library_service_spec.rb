require 'rails_helper'

RSpec.describe 'Library Service' do 
  let(:location) { 'denver, co' }
  let(:quantity) { 5 }
  describe '.get_location_books' do 
    it 'returns 5 books based on location param', :vcr do 
      response = LibraryService.get_location_books(location, quantity) 

      expect(response).to be_a(Hash)
      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_an(Integer)
      expect(response).to have_key(:docs)
      expect(response[:docs]).to be_an(Array)
      response[:docs].each do |doc|
        expect(doc).to be_a(Hash)
        expect(doc).to have_key(:title)
        expect(doc[:title]).to be_a(String)
        if doc[:isbn]
          expect(doc[:isbn]).to be_an(Array)
        else 
          expect(doc[:isbn]).to eq(nil)
        end 
        expect(doc).to have_key(:publisher)
        expect(doc[:publisher]).to be_an(Array)
      end 
    end 
  end 
end 