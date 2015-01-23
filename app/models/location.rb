class Location < ActiveRecord::Base
  validates :city, prescence: true
  validates :country, prescence: true
end
