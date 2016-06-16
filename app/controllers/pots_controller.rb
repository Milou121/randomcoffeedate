class PotsController < ApplicationController
  def index
    @pots = Pot.all
  end

  def show
    @pot = Pot.find(params[:id])
  end

  def new
    @pot = Pot.new
  end

  def create
    @pot = Pot.new(pot_params)
    @pot.save!
    redirect_to dashboard_pot_path(@pot)
  end

  def destroy
   @pot = pot.find(params[:id])
   @pot.destroy
   redirect_to pots_path
  end

  private

  def pot_params
    params.require(:pot).permit(:user_id, :location_id, :start_date, :end_date, :time_10, :time_6, :time_4, :time_2, :time_12)
  end

end
