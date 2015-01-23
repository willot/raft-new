class Location < ActiveRecord::Base
  validates :city, presence: true
  validates :country, presence: true
end
