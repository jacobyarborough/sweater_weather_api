class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create!(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
    render json: UserSerializer.new(new_user), status: 201
  end 
end

private 

def user_params
  JSON.parse(request.body.string, symbolize_names: :true)
end 