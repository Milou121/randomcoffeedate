class Pot < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :pot_friends
end
