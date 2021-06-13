class ActivitiesController < ApplicationController

    # before_action :find_user_token, only: :index 

    def index
        @activities = Activity.all
        render json: @activities
    end
end
