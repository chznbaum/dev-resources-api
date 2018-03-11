class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    authenticate params[:email], params[:password]
  end

  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result, 
        message: 'Login successful.'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def user_params
    params.permit(
      :name, 
      :email, 
      :password
    )
  end
end