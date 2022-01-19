require 'rails_helper'

RSpec.describe 'Mapquest Service' do 
  let(:location) { 'denver, co' }
  describe '.get_location' do 
    it 'can return location details', :vcr do 
      response = MapquestService.get_location(location) 

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)
      expect(response[:results][0]).to have_key(:locations)
      expect(response[:results][0][:locations]).to be_an(Array)
      expect(response[:results][0][:locations][0]).to have_key(:latLng)
      expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end 
  end 

  describe '.get_roadtrip_details' do 
    let(:start_city) { 'denver, co' }
    let(:end_city) { 'charlotte, nc' }
    it 'retruns roadtrip details', :vcr do 
      response = MapquestService.get_roadtrip_details(start_city, end_city) 

      expect(response).to be_a(Hash)
      expect(response).to have_key(:route)
      expect(response[:route]).to be_a(Hash)
      expect(response[:route]).to have_key(:formattedTime)
      expect(response[:route][:formattedTime]).to be_a(String)
    end
  end
end 