class User < ActiveRecord::Base

  has_many :pots

  # before_create :confirmation_token
  # after_create :send_welcome_email
  #

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   :trackable, :validatable, :confirmable

  include Amistad::FriendModel
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true

  def all_cups
    Cup.where("sender_id = :id OR receiver_id = :id", id: id)
  end

  private

  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  # end
end
