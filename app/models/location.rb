require 'openssl'
require 'geokit'

class Location < ActiveRecord::Base
  validates :city, presence: true
  validates :country, presence: true

  def geo_locate(ip)
    a = Geokit::Geocoders::MultiGeocoder.geocode(ip)
    @city = a.city
  end
end
