require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before { get "/api/v1/users" }
  end
end
