class Dashboard::PotsController < ApplicationController
  def index
    @pots = current_user.pots.all
  end

  def show
    @pot = current_user.pots.find(params[:id])
  end

  def new
    @pot = Pot.new
    @friends = current_user.friends
  end

  def create
    @pot = current_user.pots.new(pot_params)

    params[:friend_ids].each do |friend_id|
      @pot.pot_friends.new(friend_id: friend_id)
    end

    @pot.save!

    redirect_to dashboard_pot_path(@pot)
  end

  def destroy
   @pot = current_user.pots.find(params[:id])
   @pot.destroy
   redirect_to pots_path
  end

  private

  def pot_params
    params.require(:pot).permit(:location_id, :start_date, :end_date, :time_10, :time_6, :time_4, :time_2, :time_12)
  end

end
