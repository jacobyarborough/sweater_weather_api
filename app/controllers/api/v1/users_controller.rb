class Api::V1::UsersController < ApplicationController
  def create
    if !user_params[:password] || user_params[:password] == "" || user_params[:password] == " " || user_params[:password].length < 6
      render json: { error: 'Passowrd is invalid or left blank', status: 400 }, status: 400 
    elsif !user_params[:email] || user_params[:email] == "" || user_params[:email] == " "
      render json: { error: 'Email is invalid or left blank', status: 400 }, status: 400 
    elsif !user_params[:password_confirmation] || user_params[:password_confirmation] == "" || user_params[:password_confirmation] == " " || user_params[:password_confirmation] != user_params[:password]
      render json: { error: 'Password confirmation is invalid or left blank or does not match password', status: 400 }, status: 400 
    elsif User.find_by(email: user_params[:email])
      render json: { error: 'Email is already in use', status: 422 }, status: 422
    else
      new_user = User.create!(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
      render json: UserSerializer.new(new_user), status: 201
    end
  end 

  private 

  def user_params
    JSON.parse(request.body.string, symbolize_names: :true)
  end 
end