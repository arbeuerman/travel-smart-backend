class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
        render json: @favorites, status: :ok
    end
    
    def create
        activity_params = params[:activity]
        location = params[:location]
        @user = current_user
        @activity = Activity.find_or_create_by(
            name: activity_params["name"], 
            location: location, 
            category: activity_params["tags"].join(" ")
            )
        activityImage = ActivityImage.find_by(activityName: @activity.name)
        if activityImage
            @activity.update(imageUrl: activityImage.imageUrl)
        end
        @favorite = Favorite.create(user_id: @user.id, activity_id: @activity.id)
    end

    def delete
        @user = current_user
        @activity = Activity.find_by(name: params["favoritedActivity"]["name"])
        @favorite = Favorite.find_by(user_id: @user.id, activity_id: @activity.id)
        @favorite.destroy
    end 
end
