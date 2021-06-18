class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
        render json: @favorites, status: :ok
    end
    
    def create
        activity_params = params[:activity]
        location = params[:location]
        @user = current_user
        @activity = Activity.create(
            name: activity_params["name"], 
            location: location, 
            category: activity_params["tags"].join(" ")
            )
        @favorite = Favorite.create(user_id: @user.id, activity_id: @activity.id)
        # byebug
    end

    def delete
        @user = current_user
        @activity = Activity.find_by(name: params["favoritedActivity"]["name"])
        @favorite = Favorite.find_by(user_id: @user.id, activity_id: @activity.id)
        @favorite.destroy
    end 
end
