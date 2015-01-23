require 'ffaker'

users = 20.times.map do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    age: rand(18..60),
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::HipsterIpsum.paragraph
    })
end

locations = 20.times.map do
  Location.create!({
    city: Faker::Address.city,
    country: Faker::Address.country
    })
end

trips = 10.times.map do
  Trip.create!({
    origin: locations.sample,
    destination: locations.sample,
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
    location_id: locations.sample.id
    })
end
