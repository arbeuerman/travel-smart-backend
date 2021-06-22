class UsersController < ApplicationController

    skip_before_action :current_user, only: [:create, :index]
    # before_action :skip_password_attribute, only: [:update]

    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def create
        @user = User.new(user_params)
        @user.save
        if @user.valid?
            render json: @user, status: :created
        else
            errors = @user.errors.full_messages
            render json: errors, status: :bad_request
        end
    end

    def update
        @user = User.find(params[:id])
        if @user == current_user
            #update user
            # user_params
            if @user.update(
                username: user_params[:username],
                imageUrl: user_params[:imageUrl],
                bio: user_params[:bio]
            )
                render json: @user, status: :ok
            else
                errors = @user.errors.full_messages
                render json: {message: errors} , status: :bad_request 
            end
        else
            render json: {message: 'please log in'}, status: :forbidden
        end
    end

    def profile
        render json: @user, status: :ok
    end

    def logout
        byebug
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :imageUrl, :bio)
    end

    # def skip_password_attribute
    #     if user_params[:password].blank? && params[:user][]
    #         user_params.except(:password)
    #     end
    # end

    
end
