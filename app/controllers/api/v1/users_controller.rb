class Api::V1::UsersController < ApplicationController
  has_secure_token :auth_token
  
  def create
    binding.pry
    User.create!(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
  end 
end

private 

def user_params
  JSON.parse(request.body.string, symbolize_names: :true)
end 