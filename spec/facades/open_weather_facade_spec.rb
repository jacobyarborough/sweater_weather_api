require 'rails_helper'

RSpec.describe 'OpenWeather Facade' do 
  let(:lat) { 39.738453 }
  let(:lng) { -104.984853 }
  it '.get_weather', :vcr do 
    response = OpenWeatherFacade.get_weather(lat, lng)

    expect(response).to be_a(Hash)
    expect(response.count).to eq(2)
    expect(response).to have_key(:lat)
    expect(response[:lat]).to be_a(Float)
    expect(response).to have_key(:lng)
    expect(response[:lng]).to be_a(Float)
  end 
end 