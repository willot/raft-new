class Trip < ActiveRecord::Base
  belongs_to :origin, class_name: "Location"
  belongs_to :destination, class_name: "Location"
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :travelers
  has_many :confirmed_travelers, through: :travelers, source: :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :user_id, presence: true
end
