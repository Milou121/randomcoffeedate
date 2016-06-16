class Location < ActiveRecord::Base
  has_many :pots
  has_many :cups
end
