class Pot < ActiveRecord::Base
  belongs_to :cup
  belongs_to :location
  belongs_to :user

  has_many :pot_friends, dependent: :destroy
  has_many :friends, through: :pot_friends

  validates :location_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :has_at_least_two_friends
  validate :start_date_cant_be_bigger
  validate :has_at_least_one_time_range

  private

  def has_at_least_two_friends
    if pot_friends.size < 2
      errors.add(:base, "You must select at least 2 friends")
    end
  end

  def has_at_least_one_time_range
    if time_10 == false &&
       time_12 == false &&
       time_2 == false &&
       time_4 == false &&
       time_6 == false
       errors.add(:base, "You must select at least 1 time range")
    end
  end

  def start_date_cant_be_bigger
    if start_date > end_date
      errors.add(:start_date, "You can not reverse the time")
    end
  end
end
