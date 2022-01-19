class Api::V1::SessionsController < ApplicationController
  def create
    if !user_params[:password] || user_params[:password] == "" || user_params[:password] == " "
      render json: { error: 'Passowrd is invalid or left blank', status: 400 }, status: 400 
    elsif !user_params[:email] || user_params[:email] == "" || user_params[:email] == " "
      render json: { error: 'Email is invalid or left blank', status: 400 }, status: 400 
    else 
      if !User.find_by(email: user_params[:email])
        render json: { error: 'Email or password is incorrect', status: 422 }, status: 422
      else
        user = User.find_by(email: user_params[:email])
          if user.authenticate(user_params[:password])
            render json: UserSerializer.new(user)
          else 
            render json: { error: 'Email or password is incorrect', status: 422 }, status: 422
          end 
      end
    end 
  end

  private

  def user_params
    JSON.parse(request.body.string, symbolize_names: :true)
  end 
end
