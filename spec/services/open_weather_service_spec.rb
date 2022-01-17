require 'rails_helper'

RSpec.describe 'OpenWeather Service' do 
  let(:lat) { 39.738453 }
  let(:lng) { -104.984853 }
  describe '.get_weather_forecast' do 
    it 'can return weather forecast for a given set of coordinates', :vcr do 
      response = OpenWeatherService.get_weather_forecast(lat, lng) 

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
end 