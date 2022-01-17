require 'rails_helper'

RSpec.describe 'Mapquest Facade' do 
  let(:location) { 'denver, co' }
  it '.get_location_details', :vcr do 
    response= MapquestFacade.get_location_details(location)

    expect(response).to be_a(Hash)
  end 
end 