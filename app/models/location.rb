class Location < ActiveRecord::Base
  has_many :trips_origins, class_name: "Trip", foreign_key: "origin_id"
  has_many :trip_destinations, class_name: "Trip", foreign_key: "destination_id"

  has_many :travelers, through: :trips_origins
  has_many :users, through: :travelers

  has_many :search_result_locations
  has_many :search_results, through: :search_result_locations

  validates :city, presence: true
  validates :country, presence: true
end
