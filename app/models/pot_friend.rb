class PotFriend < ActiveRecord::Base
  belongs_to :pot

  belongs_to :friend, class_name: "User"
end
