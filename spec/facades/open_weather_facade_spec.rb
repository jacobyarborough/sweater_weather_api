require 'rails_helper'

RSpec.describe 'OpenWeather Facade' do 
  let(:lat) { 39.738453 }
  let(:lng) { -104.984853 }
  it '.get_weather', :vcr do 
    response = OpenWeatherFacade.get_weather(lat, lng)

    expect(response).to be_a(Hash)
  end 
end 