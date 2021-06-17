
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Activity.destroy_all
# Activity.reset_pk_sequence

# Bangalore,12.92321,77.642256
# Barcelona,41.397158,2.160873
# Berlin,52.490569,13.457198
# Paris,48.8,2.46
# San Francisco,37.732007,-122.370076
# Dallas,32.806993,-96.836857
# London,51.520180,-0.169882
# New York,40.792027,-74.058204

# 10.times do 
#     Activity.create(
#         name: Faker::Mountain.unique.name,
#         location: Faker::Nation.unique.capital_city,
#         imageUrl: Faker::Avatar.unique.image,
#         category: ["hiking", "food", "drinks", "museums", "culture"].sample
#         )
# end

##################################
###### Trying to Access API ######
##################################

#use the external api query here
amadeus = Amadeus::Client.new({
    client_id: '8vcUEDJFv2UhYzwB5KmgTlRyC76jMD5H',
    client_secret: 'BAV4rSS5k1XoQ1dq'
})

cities = CSV.parse(File.read("cities - Sheet1.csv"), headers: true)
cities_hash = {}
cities.each do |city_data|
    cities_hash[city_data["city"]] = [city_data["latitude"],city_data["longitude"]]
end
cityActivities = {}
cities_hash.each do |city, coordinates|
    pointsOfInterest = amadeus.reference_data.locations.points_of_interest.get(latitude: coordinates[0], longitude: coordinates[1])
    byebug
    #extract data
    pointsOfInterest.data.each do |pointOfInterest|
        Activity.create(name: pointOfInterest["name"], location: city, category: pointOfInterest["tags"].join(" "))
    end
end
