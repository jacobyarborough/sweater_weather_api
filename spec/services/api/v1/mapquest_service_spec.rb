require 'rails_helper'

RSpec.describe 'Mapquest Service' do 
  let(:location) { 'denver, co' }
  describe '.get_location' do 
    it 'can return location details', :vcr do 
      response = MapquestService.get_location(location) 

      expect(response).to be_a(Hash)
      expect(response[:results]).to be_an(Array)
      expect(response[:results][0]).to have_key(:latLng)
      expect(response[:results][0][latLng]).to be_a(Hash)
      expect(response[:results][0][latLng]).to have_key(:lat)
      expect(response[:results][0][latLng][:lat]).to be_a(Float)
      expect(response[:results][0][latLng]).to have_key(:lng)
      expect(response[:results][0][latLng][:lng]).to be_a(Float)
    end 
  end 
end 