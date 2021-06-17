require 'csv'

class TravelController < ApplicationController

  skip_before_action :current_user, only: [:location]

  def location
    input_location = params[:location]
    #extract data
    latitude = cities[input_location][0]
    longitude = cities[input_location][1]
    location_points_of_interest = points_of_interest(latitude, longitude)
    render json: location_points_of_interest.result, status: :ok
  end

  private
  def amadeus_client
    Amadeus::Client.new({
      client_id: '8vcUEDJFv2UhYzwB5KmgTlRyC76jMD5H',
      client_secret: 'BAV4rSS5k1XoQ1dq'
    })
  end

  def cities
    cities = CSV.parse(File.read("cities - Sheet1.csv"), headers: true)
    cities_hash = {}
    cities.each do |city_data|
      cities_hash[city_data["city"]] = [city_data["latitude"],city_data["longitude"]]
    end
    return cities_hash
  end

  def points_of_interest(inp_latitude, inp_longitude)
    amadeus_client.reference_data.locations.points_of_interest.get(latitude: inp_latitude, longitude: inp_longitude)
  end

end
