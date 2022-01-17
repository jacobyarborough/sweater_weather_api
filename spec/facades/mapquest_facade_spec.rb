require 'rails_helper'

RSpec.describe 'Mapquest Facade' do 
  let(:location) { 'denver, co' }
  it '.get_location_details', :vcr do 
    response = MapquestFacade.get_location_details(location)

    expect(response).to be_a(Hash)
    expect(response.count).to eq(2)
    expect(response).to have_key(:lat)
    expect(response[:lat]).to be_a(Float)
    expect(response).to have_key(:lng)
    expect(response[:lng]).to be_a(Float)
  end 
end 