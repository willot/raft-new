module SearchResultsHelper
  def convert_airport_to_city(code)
    if code != nil
    @destination = Airport.find_by(code: code).location.city
    end
  end

end
