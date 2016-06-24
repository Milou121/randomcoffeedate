class DashboardController < ApplicationController
  def show
    @user = current_user
    @pots = current_user.pots.where(cup_id: nil)
    @cups = current_user.pots.where.not(cup_id: nil).map(&:cup) # same as map { |pot| pot.cup }
  end
end
