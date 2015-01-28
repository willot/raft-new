# require 'ffaker'
require 'csv'


CSV.foreach("#{Rails.root}/lib/data/airportcodes.csv", headers: false) do |row|
    city = row[0].split(',')
    existing_location = Location.find_by(city: city[0].downcase)

    if existing_location
        existing_location.airports.create!(code: row[1])
    else
        location = Location.new(city: city[0].downcase, country: city[1])
        Airport.create!(code: row[1], location: location)
    end
end

CSV.foreach("#{Rails.root}/lib/data/airlatlng.csv", headers: false) do |row|

  if Airport.find_by(code: row[4]) != nil
    airport = Airport.find_by(code: row[4])

    lat = row[6].to_f
    long = row[7].to_f
    airport.location.update(lat: lat, lng: long)
  end
end

# users = 20.times.map do
#   User.create!({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Internet.user_name,
#     age: rand(18..60),
#     email: Faker::Internet.email,
#     password: "password",
#     bio: Faker::HipsterIpsum.paragraph,
#     guide: [true, false].sample#,
#     #location_id: Location.all.sample.id
#     })
# end

# trips = 10.times.map do
#   Trip.create!({
#     origin: Location.all.sample,
#     destination: Location.all.sample,
#     start_at: Faker::Time.date,
#     end_at: Faker::Time.date,
#     description: Faker::HipsterIpsum.paragraph,
#     user_id: users.sample.id
#     })
# end

# travelers = 30.times.map do
#   Traveler.create!({
#     user_id: users.sample.id,
#     trip_id: trips.sample.id
#     })
# end

# search_results = 5.times.map do
#   SearchResult.create!({
#     user_id: users.sample.id,
#     budget: 1500,
#     start_at: Faker::Time.date,
#     })
# end

# 20.times.map do
#   SearchResultLocation.create!({
#     search_result_id: search_results.sample.id,
#     location_id: Location.all.sample.id
#     })
# end

# messageable = [trips, users].flatten
# 40.times.map do
#   messageable.sample.messages.create!(title: Faker::Lorem.word,content: Faker::HipsterIpsum.paragraph,wrote_at: Faker::Time.date, creator_id: users.sample.id,)
# end

# messages = 10.times.map do
#     Message.create!({
#         title: Faker::Lorem.word,
#         content: Faker::HipsterIpsum.paragraph,
#         wrote_at: Faker::Time.date,
#         creator_id: users.sample.id,
#         recipient_id: users.sample.id
#         })
# end

