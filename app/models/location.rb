require 'openssl'
require 'geokit'

class Location < ActiveRecord::Base
  validates :city, presence: true
  validates :country, presence: true

  def locate(ip)
    a = Geokit::Geocoders::MultiGeocoder.geocode(ip)
    @city = a.city
  end
end
