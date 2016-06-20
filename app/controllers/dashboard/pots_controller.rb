class Dashboard::PotsController < ApplicationController
  def index
    @pots = current_user.pots.where(cup_id: nil)
  end

  def show
    @pot = current_user.pots.where(cup_id: nil).find(params[:id])
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
    @pot = current_user.pots.build(pot_params)

    params[:friend_ids].each do |friend_id|
      @pot.pot_friends.new(friend_id: friend_id)
    end

    if @pot.save
      check_for_pot_matching

      if @cup
        flash[:notice] = "You have a cup! Go check your emails ;)"
        redirect_to dashboard_cup_path(@cup)
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
   redirect_to dashboard_path

 end

 private

 def check_for_pot_matching
    # YOUR ALGO
    # matching_pot = FIND THE FIRST
    #
    # if matching_pot
    #   TODO: @cup = CREATE COFFEE
    # end
    #

    friends_pots = Pot.joins(:pot_friends).where(
      user_id: @pot.friend_ids,
      cup_id: nil,
      pot_friends: {
        friend_id: @pot.user_id
      }
      )

    friends_pots = friends_pots.where("
      (:pot_start_date <= start_date AND end_date <= :pot_end_date) OR
      (start_date <= :pot_start_date AND :pot_end_date <= end_date) OR
      (start_date < :pot_start_date AND end_date < :pot_end_date AND end_date > :pot_start_date) OR
      (:pot_start_date < start_date AND :pot_end_date < end_date AND :pot_end_date > start_date)
      ", pot_start_date: @pot.start_date, pot_end_date: @pot.end_date)

    # TODO: check time_4 ... time_12
    friends_pots = friends_pots.where("
      (:pot_time_10 == true AND time_10 == true) OR
      (:pot_time_12 == true AND time_12 == true) OR
      (:pot_time_2 == true AND time_2 == true) OR
      (:pot_time_4 == true AND time_4 == true) OR
      (:pot_time_6 == true AND time_6 == true)
      ", pot_time_10: @pot.time_10, pot_time_12: @pot.time_12, pot_time_2: @pot.time_2, pot_time_4: @pot.time_4, pot_time_6: @pot.time_6)

    matching_pot = friends_pots.order(:created_at).first
    return unless matching_pot

    # location:
    # array of friend_ids [2, 4, 5, 7]

    # time:
    # => check if matches also match on one or more of the times
    #
    @cup = Cup.create!(
      # TODO:
      # - time
      # - date
      # - location
      sender: current_user,
      receiver: matching_pot.user,
      location: matching_pot.location
      )
    @pot.update(cup: @cup)
    matching_pot.update(cup: @cup)
  end

  def marker_string(location)
    "<div class='infomap-style'><p>" + location.name + "</p><p>" + location.address + "</p></div>"
  end

  def pot_params
    params.require(:pot).permit(:location_id, :start_date, :end_date, :time_10, :time_6, :time_4, :time_2, :time_12)
  end

end
