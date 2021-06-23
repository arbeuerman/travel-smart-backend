require 'csv'

class TravelController < ApplicationController

  skip_before_action :current_user, only: [:location]

  def location
    input_location = params[:location]
    #extract data
    north = cities[input_location][0]
    west = cities[input_location][1]
    south = cities[input_location][2]
    east = cities[input_location][3]
    location_points_of_interest = points_of_interest(north, west, south, east)
    points_of_interest_plus_images = get_images(location_points_of_interest.data)
    # location_points_of_interest.result
    render json: points_of_interest_plus_images, status: :ok
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
      cities_hash[city_data["city"]] = [
        city_data["north"],
        city_data["west"],
        city_data["south"],
        city_data["east"]
      ]
    end
    return cities_hash
  end

  def points_of_interest(inp_north, inp_west, inp_south, inp_east)
    amadeus_client.reference_data.locations.points_of_interest.by_square.get(
      north: inp_north, 
      west: inp_west, 
      south: inp_south, 
      east: inp_east
    )
    #amadeus.reference_data.locations.points_of_interest.by_square.get(north: 41.397158, west: 2.160873, south: 41.394582, east: 2.177181)
  end

  def get_images(poi_json)
    poi_json.each do |point_of_interest|
      activityImage = ActivityImage.find_by(activityName: point_of_interest["name"])
      point_of_interest["imageUrl"] = activityImage.imageUrl
    end
    return poi_json
  end

end
