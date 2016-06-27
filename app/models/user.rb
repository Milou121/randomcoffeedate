class User < ActiveRecord::Base

  has_many :pots

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :trackable, :validatable, :confirmable

  include Amistad::FriendModel
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true
  validates :photo, presence: true

  def all_cups
    Cup.where("sender_id = :id OR receiver_id = :id", id: id)
  end

end
