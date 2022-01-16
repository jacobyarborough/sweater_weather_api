require 'rails_helper'

RSpec.describe 'Mapquest Facade' do 
  let(:location) { 'denver, co' }
  it '.get_location_details', :vcr do 
    lat_long = MapquestFacade.get_location_details(location)

    expect(lat_long). to be_a(string)
  end 
end 