class Dashboard::PotsController < ApplicationController
  def index
    @pots = current_user.pots.all
  end

  def show
    @pot = current_user.pots.find(params[:id])
    @cup = Cup.find(params[:id]) # how to show the date and time of this event
  end

  def new
    @pot = Pot.new
    @friends = current_user.friends
    @locations = Location.all

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow marker_string(location)
    end
  end

  def create
    @pot = current_user.pots.new(pot_params)

    params[:friend_ids].each do |friend_id|
      @pot.pot_friends.new(friend_id: friend_id)
    end

    if @pot.save
      check_for_pot_matching

      if @cup
        # redirect_to # YOUR COFFEE
      else
        redirect_to dashboard_pot_path(@pot)
      end
    else
      render :new
    end
  end

  def destroy
   @pot = current_user.pots.find(params[:id])
   @pot.destroy
   redirect_to pots_path
 end

 private

 def check_for_pot_matching
    # YOUR ALGO
    # matching_pot = FIND THE FIRST
    #
    # if matching_pot
    #   TODO: @cup = CREATE COFFEE
    # end
  end

  def marker_string(location)
    "<div class='infomap-style'><p>" + location.name + "</p><p>" + location.address + "</p></div>"
  end

  def pot_params
    params.require(:pot).permit(:location_id, :start_date, :end_date, :time_10, :time_6, :time_4, :time_2, :time_12)
  end

end
