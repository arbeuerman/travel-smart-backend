class AuthenticationController < ApplicationController
  def login
    @user = User.find_by(username: params[:user][:username])
    # byebug
    if !@user
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    else
      if !@user.authenticate params[:user][:password]
        render json: {message: 'Invalid username or password'}, status: :unauthorized
      else
        payload = {user_id: @user.id}
        secret = 'randomstringwith12345'
        token = JWT.encode(payload, secret)
        render json: {token: token}, status: :ok 
      end
    end
  end

  # def secret
  # end



end
