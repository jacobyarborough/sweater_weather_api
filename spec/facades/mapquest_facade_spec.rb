require 'rails_helper'

RSpec.describe 'Mapquest Facade' do 
  let(:location) { 'denver, co' }
  describe '.get_location_details' do
    it 'returns location details', :vcr do 
      response = MapquestFacade.get_location_details(location)

      expect(response).to be_a(Hash)
      expect(response.count).to eq(2)
      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Float)
      expect(response).to have_key(:lng)
      expect(response[:lng]).to be_a(Float)
    end 
  end 

  describe '.get_roadtrip' do 
    let(:start_city) { 'denver, co' }
    let(:end_city) { 'charlotte, nc' }
    it 'returns roadtrip details', :vcr do 
      response = MapquestFacade.get_roadtrip(start_city, end_city)

      expect(response).to be_a(Trip)
    end 
  end 
end 