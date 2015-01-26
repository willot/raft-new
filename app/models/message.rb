class Message < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
