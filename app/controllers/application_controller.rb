class ApplicationController < ActionController::API

    def find_user_token
        auth_headers = request.headers[:Authorization]
        if !auth_headers
            render json: {message: 'must sent token in request'}, status: :forbidden
        else
            token = auth_headers.split(' ')[1]
            secret = 'randomstringwith12345'
            begin
                decoded_token = JWT.decode token, secret
                payload = decoded_token.first 
                @user = User.find(payload['user_id'])
            rescue
                render json: {message: 'invlaid token'}, status: :forbidden
            end
        end
    end

    # def current_user

    # end

end
