class User < ActiveRecord::Base
  has_many :pots, dependent: :destroy
  has_many :friend_pots, dependent: :destroy, class_name: "PotFriend", foreign_key: "friend_id"

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :trackable, :validatable, :confirmable

  include Amistad::FriendModel
  mount_uploader :photo, PhotoUploader

  has_many :sent_cups, dependent: :destroy, class_name: "Cup", foreign_key: "sender_id"
  has_many :received_cups, dependent: :destroy, class_name: "Cup", foreign_key: "receiver_id"

  validates :username, presence: true, uniqueness: true
  validates :photo, presence: true

  def all_cups
    Cup.where("sender_id = :id OR receiver_id = :id", id: id)
  end

end
