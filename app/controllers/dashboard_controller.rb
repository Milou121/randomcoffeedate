class DashboardController < ApplicationController
  def show
    @user = current_user
    @pots = current_user.pots.where(cup_id: nil)
    @confirmed_cups = current_user.all_cups.where(status: "confirmed")
    @canceled_cups = current_user.all_cups.where(status: "canceled")
    # pots.where.not(cup_id: nil).map(&:cup) # same as map { |pot| pot.cup }

  end

  # def cancel
  #   @cup = current_user.pots.where.not(cup_id: nil).map(&:cup)
  #   @cup.status = "canceled"
  #   @cup.save!
  # end
end
