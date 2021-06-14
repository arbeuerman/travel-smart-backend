class UsersController < ApplicationController

    skip_before_action :current_user, only: [:create, :index]

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

    def show
        @user = current_user
        render json: current_user, status: :ok
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :imageUrl)
    end

    
end
