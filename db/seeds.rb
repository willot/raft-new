require 'ffaker'
require 'csv'

CSV.foreach("#{Rails.root}/lib/data/airportcodes.csv") do |row|
    city = row[0].split(',')
    Location.create!(city: city[0], country: city[1] )
    Airport.create!(code: row[1])
end

users = 20.times.map do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    age: rand(18..60),
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::HipsterIpsum.paragraph,
    location_id: Location.all.sample.id
    })
end

trips = 10.times.map do
  Trip.create!({
    origin: Location.all.sample,
    destination: Location.all.sample,
    start_at: Faker::Time.date,
    end_at: Faker::Time.date,
    description: Faker::HipsterIpsum.paragraph,
    user_id: users.sample.id
    })
end

travelers = 30.times.map do
  Traveler.create!({
    user_id: users.sample.id,
    trip_id: trips.sample.id
    })
end

search_results = 5.times.map do
  SearchResult.create!({
    user_id: users.sample.id,
    budget: 1500,
    start_at: Faker::Time.date,
    end_at: Faker::Time.date,
    })
end

20.times.map do
  SearchResultLocation.create!({
    search_result_id: search_results.sample.id,
    location_id: Location.all.sample.id
    })
end




