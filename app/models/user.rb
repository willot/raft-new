class User < ActiveRecord::Base
  belongs_to :location

  has_many :travelers
  has_many :trips, through: :travelers

  has_many :created_trips, class_name: "Trip", source: :creator

  has_many :destinations, through: :trips
  has_many :origins, through: :trips

  has_many :search_results
  has_many :search_result_locations, through: :search_results
  has_many :searched_locations, through: :search_result_locations, source: :location

  has_many :created_messages, class_name: "Message", foreign_key: :creator_id
  has_many :received_messages, class_name: "Message", foreign_key: :recipient_id

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_length_of :bio,
    :maximum => 2000,
    :too_long => "You are limited to 2000 characters"

  # mount_uploader :avatar, AvatarUploader
  has_secure_password
end
