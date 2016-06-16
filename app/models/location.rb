class Location < ActiveRecord::Base
  has_many :pots
  has_many :koffies

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
