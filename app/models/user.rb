class User < ActiveRecord::Base


  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_length_of :bio,
    :minimum => 100,
    :maximum => 2000,
    :too_short => "You need at least 100 characters",
    :too_long => "You are limited to 2000 characters"

  validates_length_of :password,
     :maximum => 6,
     :minimum => 20,
     :too_short => "You need at least 6 characters",
    :too_long => "You are limited to 20 characters"

  has_secure_password

end
