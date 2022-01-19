require 'rails_helper'

RSpec.describe Weather do
  let(:time) { "15:47:55" }
  let(:weather) { WeatherTime.new(data, time) }

  context 'time is below 48 hours' do 
    it 'has attributes' do 
      expect(weather.weather_at_eta).to be_a(Hash)
      expect(weather.weather_at_eta[:temperature]).to eq(45.39)
      expect(weather.weather_at_eta[:conditions]).to eq("clear sky")
    end 
  end

  context 'time is over 48 hours' do 
    let(:time) { "95:47:55" }
    it 'has attributes' do 
      expect(weather.weather_at_eta).to be_a(Hash)
      expect(weather.weather_at_eta[:temperature]).to eq("Forecast not yet available")
      expect(weather.weather_at_eta[:conditions]).to eq("Forecast not yet available")
    end 
  end 

  context 'time is equal to impossible route' do 
    let(:time) { "Impossible Route" }
    it 'has attributes' do 
      expect(weather.weather_at_eta).to be_a(Hash)
      expect(weather.weather_at_eta).to be_empty
    end 
  end 
end 