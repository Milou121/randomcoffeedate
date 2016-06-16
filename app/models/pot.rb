class Pot < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  has_many :pot_friends
  has_many :friends, through: :pot_friends
end
