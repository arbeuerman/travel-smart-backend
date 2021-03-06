class AuthenticationController < ApplicationController

  skip_before_action :current_user

  def login
    @user = User.find_by(username: params[:user][:username])
    if !@user 
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    else
      if !@user.authenticate(params[:user][:password])
      render json: { message: 'Invalid username or password' }, status: :unauthorized
      else
        payload = {user_id: @user.id}
        secret = 'randomstringwith12345'
        token = JWT.encode(payload, secret)
        render json: {token: token}, status: :ok 
      end
    end
  end
end
