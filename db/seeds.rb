# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Activity.destroy_all
Activity.reset_pk_sequence


10.times do 
    Activity.create(
        name: Faker::Mountain.unique.name,
        location: Faker::Nation.unique.capital_city,
        imageUrl: Faker::Avatar.unique.image,
        category: ["hiking", "food", "drinks", "museums", "culture"].sample
        )
end

##################################
###### Trying to Access API ######
##################################
# amadeus = Amadeus::Client.new({
#   client_id: '8vcUEDJFv2UhYzwB5KmgTlRyC76jMD5H',
#   client_secret: 'BAV4rSS5k1XoQ1dq'
# })

# def locations
#     Amadeus::Namespaces::ReferenceData::Locations.new(client)
# end

# response = amadeus.reference_data.locations.point_of_interest('9CB40CB5D0').get()
# name = response.data['name']
# # pointsOfInterest = amadeus.reference_data.locations.points_of_interest.get(latitude: 41.397158, longitude: 2.160873)
# pointsOfInterest = amadeus.reference_data.locations.points_of_interest.get(latitude: 35.6897, longitude: 139.6922)
# pOIs = pointsOfInterest.data
# # category = response.data['category']
# # tags = response.data['tags']

# locations = amadeus.reference_data.locations

# # locations = amadeus.reference_data.locations.get()
# # allPOIs = amadeus.reference_data.locations.points_of_interest

# byebug
# puts "done"
# # byebug
