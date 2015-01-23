class Traveler < ActiveRecord::Base
  validates :user, presence: true
  validates :trip, presence: true
end
