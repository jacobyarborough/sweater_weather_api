require 'rails_helper'

RSpec.describe "Trips", type: :request do
  describe 'POST /road_trip' do 
    let!(:user) { create(:user, password: 'abc1234', password_confirmation: 'abc1234', api_key: 'aaaaaaaaaa') }
    let(:body) { {"origin": "Denver, CO", "destination": "Pueblo, CO", api_key: 'aaaaaaaaaa'} }
    let(:headers) { {"CONTENT_TYPE" => "application/json"} }
    before { post "/api/v1/road_trip" ,headers: headers, params: body.to_json }

    context 'when the reqest is valid' do
      it 'returns trip details' do 
        trip_details = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(trip_details).not_to be_empty 
        expect(trip_details).to be_a(Hash)
        expect(trip_details[:id]).to eq(nil)
        expect(trip_details[:type]).to eq('roadtrip')
        expect(trip_details).to have_key(:attributes)
        expect(trip_details[:attributes]).to have_key(:start_city)
        expect(trip_details[:attributes][:start_city]).to be_a(String)
        expect(trip_details[:attributes]).to have_key(:end_city)
        expect(trip_details[:attributes][:end_city]).to be_a(String)
        expect(trip_details[:attributes]).to have_key(:travel_time)
        expect(trip_details[:attributes][:travel_time]).to be_a(String)
        expect(trip_details[:attributes]).to have_key(:weather_at_eta)
        expect(trip_details[:attributes][:weather_at_eta]).to be_a(Hash)
        expect(trip_details[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(trip_details[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(trip_details[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(trip_details[:attributes][:weather_at_eta][:conditions]).to be_a(String)
      end
    end

    context 'api key is left blank' do 
      let(:body) { {"origin": "Denver, CO", "destination": "Pueblo, CO", api_key: ' '} }

      it 'returns status code 401' do 
        expect(response).to have_http_status(401)
        expect(response.body).to match(/"Missing or Unauthorized API Key"/)
      end 
    end 

    context 'api key is empty' do 
      let(:body) { {"origin": "Denver, CO", "destination": "Pueblo, CO", api_key: ''} }

      it 'returns status code 401' do 
        expect(response).to have_http_status(401)
        expect(response.body).to match(/"Missing or Unauthorized API Key"/)
      end 
    end 

    context 'api key is not sent' do 
      let(:body) { {"origin": "Denver, CO", "destination": "Pueblo, CO"} }

      it 'returns status code 401' do 
        expect(response).to have_http_status(401)
        expect(response.body).to match(/"Missing or Unauthorized API Key"/)
      end 
    end 

    context 'origin is left blank' do 
      let(:body) { {"origin": " ", "destination": "Pueblo, CO", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Incorrect or missing origin/)
      end 
    end 

    context 'origin is empty' do 
      let(:body) { {"origin": "", "destination": "Pueblo, CO", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Incorrect or missing origin/)
      end 
    end 

    context 'origin field is not sent' do 
      let(:body) { {"destination": "Pueblo, CO", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Incorrect or missing origin/)
      end 
    end 

    context 'destination is left blank' do 
      let(:body) { {"origin": "Denver, CO", "destination": " ", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/"Incorrect or missing destination"/)
      end 
    end 

    context 'destination is empty' do 
      let(:body) { {"origin": "Denver, CO", "destination": "", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/"Incorrect or missing destination"/)
      end 
    end 

    context 'destination field is not sent' do 
      let(:body) { {"origin": "Denver, CO", api_key: 'aaaaaaaaaa'} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/"Incorrect or missing destination"/)
      end 
    end 
  end
end