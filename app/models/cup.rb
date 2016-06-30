class Cup < ActiveRecord::Base
  belongs_to :location

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :canceled_by, class_name: "User"

  has_many :pots, dependent: :destroy
end
