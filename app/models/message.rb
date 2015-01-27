class Message < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :messageable, polymorphic: true
end
