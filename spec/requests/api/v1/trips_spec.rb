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
      end
    end
  end
end