class FavoritesController < ApplicationController

    def index
        @current_user = current_user
        byebug
        @favorites = Favorite.all
        render json: @favorites, status: :ok
    end
end
