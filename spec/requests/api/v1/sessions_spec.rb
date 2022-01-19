require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /sessions" do
    let!(:user) { create(:user, password: 'abc1234', password_confirmation: 'abc1234', api_key: 'aaaaaaaaaa') }
    let(:body) { {"email": user.email, "password": user.password} }
    let(:headers) { {"CONTENT_TYPE" => "application/json"} }
    before { post "/api/v1/sessions" ,headers: headers, params: body.to_json }

    context 'when the reqest is valid' do
      it 'returns a user object' do 
        valid_user = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(valid_user).not_to be_empty 
        expect(valid_user).to be_a(Hash)
        expect(valid_user[:type]).to eq('users')
        expect(valid_user[:id]).to eq(user.id.to_s)

        expect(valid_user).to be_a(Hash)
        expect(valid_user.count).to eq(3)
        expect(valid_user).to have_key(:attributes)
        expect(valid_user[:attributes]).to be_a(Hash)
        expect(valid_user[:attributes].count).to eq(2)
        expect(valid_user[:attributes]).to have_key(:email)
        expect(valid_user[:attributes][:email]).to eq(user.email.to_s)
        expect(valid_user[:attributes]).to have_key(:api_key) 
        expect(valid_user[:attributes][:api_key]).to eq(user.api_key.to_s)
      end 
    end 

    context 'password is left blank' do 
      let(:body) { {"email": user.email, "password": " "} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'password is empty' do 
      let(:body) { {"email": user.email, "password": ""} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'password field is not sent' do 
      let(:body) { {"email": user.email} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'email is left blank' do 
      let(:body) { {"email": " ", "password": user.password} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 

    context 'email is empty' do 
      let(:body) { {"email": "", "password": user.password} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 
    
    context 'email field is not sent' do 
      let(:body) { {"password": user.password} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 

    context 'email field is not with an existing user' do 
      let(:body) { {"email": "jjj@gmail.com", "password": user.password} }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
        expect(response.body).to match(/Email or password is incorrect/)
      end 
    end 

    context 'email is valid but password does not match' do 
      let(:body) { {"email": user.email, "password": "notpassword"} }

      it 'returns status code 422' do 
        expect(response).to have_http_status(422)
        expect(response.body).to match(/Email or password is incorrect/)
      end 
    end 
  end
end
