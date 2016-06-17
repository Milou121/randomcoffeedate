class User < ActiveRecord::Base

  has_many :pots

  # before_create :confirmation_token
  # after_create :send_welcome_email
  #

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  include Amistad::FriendModel
  mount_uploader :photo, PhotoUploader

  validates :username, presence: true, uniqueness: true

  private

  def send_on_create_confirmation_instructions
  end
  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  # end
end
