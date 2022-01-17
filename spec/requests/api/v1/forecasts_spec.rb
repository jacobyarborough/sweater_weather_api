require 'rails_helper'

RSpec.describe "Forecasts API", type: :request do
  let(:location) { 'denver, co' }

  describe "GET /forecast" do
    before { get "/api/v1/forecast?location=#{location}" }

    context 'when the request is valid' do 
      it 'returns the weather forecast for denver' do 
        forecast = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(forecast).not_to be_empty
        expect(forecast[:id]).to eq(nil)
        expect(forecast[:type]).to eq('forecast')
        expect(forecast[:attributes]).to be_a(Hash)
        expect(forecast[:attributes].count).to eq(3)
        expect(forecast[:attributes]).not_to have_key(:minutely)
        expect(forecast[:attributes]).not_to have_key(:alerts)

        expect(forecast[:attributes]).to have_key(:current_weather)
        expect(forecast[:attributes][:current_weather]).to be_a(Hash)
        expect(forecast[:attributes][:current_weather]).to have_key(:datetime)
        expect(forecast[:attributes][:current_weather][:datetime]).to be_a(String)
        expect(forecast[:attributes][:current_weather]).to have_key(:sunrise)
        expect(forecast[:attributes][:current_weather][:sunrise]).to be_a(String)
        expect(forecast[:attributes][:current_weather]).to have_key(:sunset)
        expect(forecast[:attributes][:current_weather][:sunset]).to be_a(String)
        expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
        expect(forecast[:attributes][:current_weather][:temperature]).to be_a(Float)
        expect(forecast[:attributes][:current_weather]).to have_key(:feels_like)
        expect(forecast[:attributes][:current_weather][:feels_like]).to be_a(Float)
        expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
        expect(forecast[:attributes][:current_weather][:humidity]).to be_an(Integer)
        expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
        expect(forecast[:attributes][:current_weather][:uvi]).to be_a(Float)
        expect(forecast[:attributes][:current_weather]).to have_key(:visibility)
        expect(forecast[:attributes][:current_weather][:visibility]).to be_an(Integer)
        expect(forecast[:attributes][:current_weather]).to have_key(:conditions)
        expect(forecast[:attributes][:current_weather][:conditions]).to be_a(String)
        expect(forecast[:attributes][:current_weather]).to have_key(:icon)
        expect(forecast[:attributes][:current_weather][:icon]).to be_a(String)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:pressure)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:dew_point)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:clouds)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:wind_speed)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:wind_deg)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:wind_gust)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:id)
        expect(forecast[:attributes][:current_weather]).not_to have_key(:main)

        expect(forecast[:attributes]).to have_key(:daily_weather)
        expect(forecast[:attributes][:daily_weather]).to be_an(Array)
        expect(forecast[:attributes][:daily_weather].count).to eq(5)
        forecast[:attributes][:daily_weather].each do |day|
          expect(day).to have_key(:date) 
          expect(day[:date]).to be_a(String)
          expect(day).to have_key(:sunrise) 
          expect(day[:sunrise]).to be_a(String)
          expect(day).to have_key(:sunset) 
          expect(day[:sunset]).to be_a(String)
          expect(day).to have_key(:max_temp) 
          expect(day[:max_temp]).to be_a(Float)
          expect(day).to have_key(:min_temp) 
          expect(day[:min_temp]).to be_a(Float)
          expect(day).to have_key(:conditions) 
          expect(day[:conditions]).to be_a(String)
          expect(day).to have_key(:icon) 
          expect(day[:icon]).to be_a(String)
          expect(day).not_to have_key(:pressure)
          expect(day).not_to have_key(:dew_point)
          expect(day).not_to have_key(:clouds)
          expect(day).not_to have_key(:wind_speed)
          expect(day).not_to have_key(:wind_deg)
          expect(day).not_to have_key(:wind_gust)
          expect(day).not_to have_key(:id)
          expect(day).not_to have_key(:main)
          expect(day).not_to have_key(:moonrise)
          expect(day).not_to have_key(:moonset)
          expect(day).not_to have_key(:moon_phase)
          expect(day).not_to have_key(:pop)
        end 

        expect(forecast[:attributes]).to have_key(:hourly_weather)
        expect(forecast[:attributes][:hourly_weather]).to be_an(Array)
        expect(forecast[:attributes][:hourly_weather].count).to eq(8)
        forecast[:attributes][:hourly_weather].each do |hour|
          expect(hour).to have_key(:time) 
          expect(hour[:time]).to be_a(String)
          expect(hour).to have_key(:temperature) 
          expect(hour[:temperature]).to be_a(Float)
          expect(hour).to have_key(:conditions) 
          expect(hour[:conditions]).to be_a(String)
          expect(hour).to have_key(:icon) 
          expect(hour[:icon]).to be_a(String)
          expect(hour).not_to have_key(:pressure)
          expect(hour).not_to have_key(:dew_point)
          expect(hour).not_to have_key(:clouds)
          expect(hour).not_to have_key(:wind_speed)
          expect(hour).not_to have_key(:wind_deg)
          expect(hour).not_to have_key(:wind_gust)
          expect(hour).not_to have_key(:id)
          expect(hour).not_to have_key(:main)
        end 
      end 

      it 'returns status code 200' do 
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end 
    end 

    context 'when the request is invalid' do 
      let(:location) { ' ' }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find location or location does not exist/)
      end
    end 
  end
end
