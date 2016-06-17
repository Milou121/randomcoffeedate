class Pot < ActiveRecord::Base
  belongs_to :cup
  belongs_to :location
  belongs_to :user

  has_many :pot_friends
  has_many :friends, through: :pot_friends
end
