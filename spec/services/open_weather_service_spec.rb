require 'rails_helper'

RSpec.describe 'OpenWeather Service' do 
  let(:lat) { 39.738453 }
  let(:lng) { -104.984853 }
  describe '.get_weather_forecast' do 
    it 'can return weather forecast for a given set of coordinates', :vcr do 
      response = OpenWeatherService.get_weather_forecast(lat, lng) 

      expect(response).to be_a(Hash)
      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Float)
      expect(response).to have_key(:lon)
      expect(response[:lon]).to be_a(Float)
      expect(response).to have_key(:timezone)
      expect(response[:timezone]).to be_a(String)
      expect(response).to have_key(:timezone_offset)
      expect(response[:timezone_offset]).to be_an(Integer)

      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)
      expect(response[:current]).to have_key(:dt)
      expect(response[:current][:dt]).to be_an(Integer)
      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current][:sunrise]).to be_an(Integer)
      expect(response[:current]).to have_key(:sunset)
      expect(response[:current][:sunset]).to be_an(Integer)
      expect(response[:current]).to have_key(:temp)
      expect(response[:current][:temp]).to be_a(Float)
      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current][:feels_like]).to be_a(Float)
      expect(response[:current]).to have_key(:humidity)
      expect(response[:current][:humidity]).to be_an(Integer)
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current][:uvi]).to be_an(Integer)
      expect(response[:current]).to have_key(:visibility)
      expect(response[:current][:visibility]).to be_an(Integer)
      expect(response[:current]).to have_key(:weather)
      expect(response[:current][:weather]).to be_an(Array)
      expect(response[:current][:weather][0]).to have_key(:description)
      expect(response[:current][:weather][0][:description]).to be_a(String)
      expect(response[:current][:weather][0]).to have_key(:icon)
      expect(response[:current][:weather][0][:icon]).to be_a(String)

      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an(Array)
      response[:daily].each do |day|
        expect(day).to have_key(:dt)
        expect(day[:dt]).to be_an(Integer)
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_an(Integer)
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_an(Integer)
        expect(day).to have_key(:temp)
        expect(day[:temp]).to be_a(Hash)
        expect(day[:temp]).to have_key(:max)
        expect(day[:temp][:max]).to be_a(Float)
        expect(day[:temp]).to have_key(:min)
        expect(day[:temp][:min]).to be_a(Float)
        expect(day).to have_key(:weather)
        expect(day[:weather]).to be_an(Array)
        expect(day[:weather][0]).to have_key(:description)
        expect(day[:weather][0][:description]).to be_a(String)
        expect(day[:weather][0]).to have_key(:icon)
        expect(day[:weather][0][:icon]).to be_a(String)
      end 

      expect(response).to have_key(:hourly)
      expect(response[:hourly]).to be_an(Array)
      response[:hourly].each do |hour|
        expect(hour).to have_key(:dt)
        expect(hour[:dt]).to be_an(Integer)
        expect(hour).to have_key(:temp)
        expect(hour[:temp]).to be_a(Float)
        expect(hour).to have_key(:weather)
        expect(hour[:weather]).to be_an(Array)
        expect(hour[:weather][0]).to have_key(:description)
        expect(hour[:weather][0][:description]).to be_a(String)
        expect(hour[:weather][0]).to have_key(:icon)
        expect(hour[:weather][0][:icon]).to be_a(String)
      end 
    end 
  end 
end 