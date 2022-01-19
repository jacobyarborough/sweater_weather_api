require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let(:body) { {"email": "abc123@gmail.com", "password": "password", "password_confirmation": "password"} }
    let(:headers) { {"CONTENT_TYPE" => "application/json"} }
    before { post "/api/v1/users" ,headers: headers, params: body.to_json }

    context 'when the reqest is valid' do
      it 'returns a user object' do 
        new_user = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(new_user).not_to be_empty 
        expect(new_user).to be_a(Hash)
        expect(new_user[:type]).to eq('users')
        expect(new_user[:id]).to be_a(String)

        expect(new_user).to be_a(Hash)
        expect(new_user.count).to eq(3)
        expect(new_user).to have_key(:attributes)
        expect(new_user[:attributes]).to be_a(Hash)
        expect(new_user[:attributes]).count).to eq(2)
        expect(new_user[:attributes]).to have_key(:email)
        expect(new_user[:attributes][:email]).to be_a(String)
        expect(new_user[:attributes]).to have_key(:api_key) 
        expect(new_user[:attributes][:api_key]).to be_a(String)
      end  
    end 
  end
end
