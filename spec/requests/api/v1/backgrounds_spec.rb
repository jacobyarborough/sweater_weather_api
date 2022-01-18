require 'rails_helper'

RSpec.describe "Backgrounds", type: :request do
  let(:location) { 'denver, co' }
  describe "GET /background" do
    before { get "/api/v1/background?location=#{location}" }

    context 'when the request is valid' do 
      it 'returns an image url for the location' do 
        image_hash = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(image_hash).not_to be_empty
        expect(image_hash[:id]).to eq(nil)
        expect(image_hash[:type]).to eq('image')
        expect(image_hash[:attributes]).to be_a(Hash)
        expect(image_hash[:attributes].count).to eq(1)

        expect(image_hash[:attributes]).to have_key(:image)
        expect(image_hash[:attributes][:image]).to be_a(Hash)
        expect(image_hash[:attributes][:image]).to have_key(:location)
        expect(image_hash[:attributes][:image][:location]).to be_a(String)
        expect(image_hash[:attributes][:image]).to have_key(:image_url)
        expect(image_hash[:attributes][:image][:image_url]).to be_a(String)
        expect(image_hash[:attributes][:image]).to have_key(:credit)
        expect(image_hash[:attributes][:image][:credit]).to be_a(Hash)
        expect(image_hash[:attributes][:image][:credit]).to have_key(:source)
        expect(image_hash[:attributes][:image][:credit][:source]).to be_a(String)
        expect(image_hash[:attributes][:image][:credit]).to have_key(:author)
        expect(image_hash[:attributes][:image][:credit][:author]).to be_a(String)
      end

      it 'returns status code 200' do 
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end 

    context 'the request is invalid' do 
      let(:location) { ' ' }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/{\"error\":\"Can't find location or location was entered incorrectly\",\"status\":404}/)
      end
    end 
  end
end
