class ActivitiesController < ApplicationController

    skip_before_action :current_user, only: :index 

    def index
        @activities = Activity.all
        #use the external api query here
        render json: @activities
    end
end
