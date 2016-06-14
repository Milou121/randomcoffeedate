class Koffie < ActiveRecord::Base
  belongs_to :location

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
