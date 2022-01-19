require 'rails_helper'

RSpec.describe Roadtrip do
  let(:start_city) { 'denver, co' }
  let(:end_city) { 'charlotte, nc' }
  let(:good_time) { "15:47:55" }
  let(:travel) { Trip.new(trip_results, start_city, end_city) }
  let(:forecast) { WeatherTime.new(data, good_time) }
  let(:roadtrip) { Roadtrip.new(travel, forecast) }

  context 'route is possible' do 
    it 'has attributes' do 
      expect(roadtrip.id).to eq(nil)
      expect(roadtrip.type).to eq('roadtrip')
      expect(roadtrip.start_city).to eq('denver, co')
      expect(roadtrip.end_city).to eq('charlotte, nc')
      expect(roadtrip.travel_time).to eq('23 hour(s) and 3 minutes')
      expect(roadtrip.weather_at_eta[:temperature]).to eq(45.39)
      expect(roadtrip.weather_at_eta[:conditions]).to eq("clear sky")
    end 
  end 

  context 'route is not possible' do 
    let(:start_city) { 'denver, co' }
    let(:end_city) { 'maui, hi' }
    let(:bad_time) { "Impossible Route" }
    let(:travel) { Trip.new(bad_trip_results, start_city, end_city) }
    let(:forecast) { WeatherTime.new(data, bad_time) }
    let(:roadtrip) { Roadtrip.new(travel, forecast) }

    it 'has attributes' do 
      expect(roadtrip.id).to eq(nil)
      expect(roadtrip.type).to eq('roadtrip')
      expect(roadtrip.start_city).to eq('denver, co')
      expect(roadtrip.end_city).to eq('maui, hi')
      expect(roadtrip.travel_time).to eq('Impossible Route')
      expect(roadtrip.weather_at_eta).to be_empty
    end 
  end 
end