class Location < ActiveRecord::Base
  has_many :pots
  has_many :koffies
end
