require 'csv'
# import '../cities.csv'


class ActivitiesController < ApplicationController

    skip_before_action :current_user, only: :index 

    def index
        @activities = Activity.all
        # byebug
        render json: @activities
        end
    end
