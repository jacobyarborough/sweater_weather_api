require 'rails_helper'

RSpec.describe Trip do
  let(:start_city) { 'denver, co' }
  let(:end_city) { 'charlotte, nc' }
  let(:trip) { Trip.new(trip_results, start_city, end_city) }

  context 'route is possible' do 
    it 'has attributes' do 
      expect(trip.travel_info).to be_a(Hash)
      expect(trip.travel_info[:start_city]).to eq('denver, co')
      expect(trip.travel_info[:end_city]).to eq('charlotte, nc')
      expect(trip.travel_info[:time]).to eq("23:03:17")
    end 
  end 

  context 'route is not possible' do 
    let(:start_city) { 'denver, co' }
    let(:end_city) { 'maui, hi' }
    let(:trip) { Trip.new(bad_trip_results, start_city, end_city) }
    it 'has attributes' do 
      expect(trip.travel_info).to be_a(Hash)
      expect(trip.travel_info[:start_city]).to eq('denver, co')
      expect(trip.travel_info[:end_city]).to eq('maui, hi')
      expect(trip.travel_info[:time]).to eq("Impossible Route")
    end 
  end 
end