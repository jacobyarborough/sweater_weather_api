require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
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
        expect(new_user[:attributes].count).to eq(2)
        expect(new_user[:attributes]).to have_key(:email)
        expect(new_user[:attributes][:email]).to be_a(String)
        expect(new_user[:attributes]).to have_key(:api_key) 
        expect(new_user[:attributes][:api_key]).to be_a(String)
      end  

      it 'returns status code 201' do 
        expect(response).to be_successful
        expect(response).to have_http_status(201)
      end 
    end 

    context 'password is left blank' do 
      let(:body) { {"email": "abc123@gmail.com", "password": " ", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'password is empty' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'password field not sent' do 
      let(:body) { {"email": "abc123@gmail.com", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'password field is too short' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "pass", "password_confirmation": "pass"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Passowrd is invalid or left blank/)
      end 
    end 

    context 'email is left blank' do 
      let(:body) { {"email": " ", "password": "password", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 

    context 'email is empty' do 
      let(:body) { {"email": "", "password": "password", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 

    context 'email field is not sent' do 
      let(:body) { {"password": "password", "password_confirmation": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Email is invalid or left blank/)
      end 
    end 

    context 'password confirmation field does not match password' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "password", "password_confirmation": "pass"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Password confirmation is invalid or left blank or does not match password/)
      end 
    end 

    context 'password confirmation field is blank' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "password", "password_confirmation": " "} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Password confirmation is invalid or left blank or does not match password/)
      end 
    end 

    context 'password confirmation field is empty' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "password", "password_confirmation": ""} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Password confirmation is invalid or left blank or does not match password/)
      end 
    end 

    context 'password confirmation field is not sent' do 
      let(:body) { {"email": "abc123@gmail.com", "password": "password"} }

      it 'returns status code 400' do 
        expect(response).to have_http_status(400)
        expect(response.body).to match(/Password confirmation is invalid or left blank or does not match password/)
      end 
    end 
  end
end
