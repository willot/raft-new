module SearchResultsHelper
  def convert_airport_to_city(code)
    @destination = Airport.find_by(code: code).location.city
  end

  def convert_city_to_airport(current_city)
    Location.find_by(city: current_city).airport.code
  end
end
