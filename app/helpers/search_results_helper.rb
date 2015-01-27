module SearchResultsHelper
  def convert_airport_to_city(code)
    if code != nil
    @destination = Airport.find_by(code: code).location.city
    end
  end

  def make_url(result)
    url = "blah"
  end

  def momondo_url(result)
    query = URI.encode_www_form({
                                  :"Search" => true,
                                  :"TripType" => "return",
                                  :"SegNo" => 2,
                                  :"SO0" => result.origin,
                                  :"SD0" => result.destination,
                                  :"SDP0" => result.depart_time,
                                  :"SO1" => result.destination,
                                  :"SD1" => result.origin,
                                  :"SDP1" => result.return_time,
                                  :"AD" => 1,
                                  :"rt" => true,
                                  :"Search" => true,
                                  :TripType => "return",
                                  :SegNo => 2,
                                  :SO0 => result.origin,
                                  :SD0 => result.destination,
                                  :SDP0 => result.depart_time,
                                  :SO1 => result.destination,
                                  :SD1 => result.origin,
                                  :SDP1 => result.return_time,
                                  :AD => 1,
                                  :TK => "ECO",
                                  :DO => false,
                                  :NA => false
                                })
    "http://www.momondo.com/multicity/?#{query}"
  end
end
