class Trip < ActiveRecord::Base
  validates :origin, presence: true
  validates :destination, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :user, presence: true
end
