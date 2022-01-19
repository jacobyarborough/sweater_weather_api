require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let(:body) { {"email": "abc123@gmail.com", "password": "password", "password_confirmation": "password"} }
    before { post "/api/v1/users", params: body.to_json }

    it 'returns things' do 
    end
  end
end
