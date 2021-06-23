class ApplicationController < ActionController::API

    before_action :current_user

    def auth_header
        request.headers[:Authorization]
    end

    def authorize_user
        if !auth_header
            render json: {message: 'must send token in request'}, status: :forbidden
        else
            token = auth_header.split(' ')[1]
            secret = 'randomstringwith12345'
            begin
                JWT.decode token, secret
            rescue
                nil
            end
        end
    end
    
    def current_user
        if authorize_user
            payload = authorize_user.first 
            @user = User.find(payload['user_id'])
        else
            render json: {message: 'invalid token'}, status: :forbidden
        end
    end

end
