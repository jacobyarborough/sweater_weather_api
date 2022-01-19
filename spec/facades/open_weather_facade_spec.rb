require 'rails_helper'

RSpec.describe 'OpenWeather Facade' do 
  let(:lat) { 39.738453 }
  let(:lng) { -104.984853 }
  let(:time) { "15:45:32" }

  describe '.get_weather' do 
    it 'returns a weather object', :vcr do 
      response = OpenWeatherFacade.get_weather(lat, lng)

      expect(response).to be_a(Weather)
    end 
  end

  describe '.get_weather_at_time' do 
    it 'returns a weather object', :vcr do 
      response = OpenWeatherFacade.get_weather_at_time(lat, lng, time)

      expect(response).to be_a(WeatherTime)
    end 
  end
end 