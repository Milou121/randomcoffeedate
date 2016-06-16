class Location < ActiveRecord::Base
  has_many :pots
  has_many :cups

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
