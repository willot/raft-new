require 'ffaker'

users = 20.times.map do
  User.create!({
    first_name:
    last_name:
    username: Faker::Internet.user_name
    age:
    email:
    password: "password"
    bio:
    })
end

locations = 20.times.map do
  Location.create!({

    })
end

trips = 10.times.map do
  Trip.create!({

    })
end

travelers = 30.times.map do
  Traveler.create!({

    })

search_results = 5.times.map do
  Search_result.create!({

    })
end

20.times.map do
  Search_result_location.create!({

    })
end
