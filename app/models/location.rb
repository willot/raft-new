require 'openssl'
require 'geokit'

class Location < ActiveRecord::Base
  has_many :trip_origins, class_name: "Trip", foreign_key: "origin_id"
  has_many :trip_destinations, class_name: "Trip", foreign_key: "destination_id"

  has_many :travelers, through: :trip_origins
  has_many :users, through: :travelers

  has_many :search_result_locations
  has_many :search_results, through: :search_result_locations

  has_many :airports

  has_many :guides, class_name: "User", foreign_key: "location_id"

  validates :city, presence: true

  def geo_locate(ip)
    Geokit::Geocoders::MultiGeocoder.geocode(ip).city
  end

  def latitude(city)
    Geokit::Geocoders::GoogleGeocoder.geocode(city).lat
  end

  def longitude(city)
    Geokit::Geocoders::GoogleGeocoder.geocode(city).lng
  end
end



