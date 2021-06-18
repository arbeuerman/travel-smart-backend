
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Favorite.destroy_all
Favorite.reset_pk_sequence
Activity.destroy_all
Activity.reset_pk_sequence

# Bangalore,12.92321,77.642256
# Barcelona,41.397158,2.160873
# Berlin,52.490569,13.457198
# Paris,48.8,2.46
# San Francisco,37.732007,-122.370076
# Dallas,32.806993,-96.836857
# London,51.520180,-0.169882
# New York,40.792027,-74.058204

# Activity.all.each do |activity|
#     if activity.imageUrl
#         ActivityImage.create(activityName: activity.name, imageUrl: activity.imageUrl)
#     end
# end





