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
      marker.picture({
                    url: "http://res.cloudinary.com/dvj9whqch/image/upload/v1466683670/filter_ncpxki.png",
                    width: "55",
                    height: "48"
                   })
    end
  end

  def create
    @pot = current_user.pots.build(pot_params)

    date_array = @pot.datestring.split(" - ")
    start_date = Date.parse(date_array[0])
    end_date = Date.parse(date_array[1])

    @pot.start_date = start_date
    @pot.end_date = end_date

    params[:friend_ids].each do |friend_id|
      @pot.pot_friends.new(friend_id: friend_id)
    end

    if @pot.save
      check_for_pot_matching

      if @cup
        flash[:notice] = "You have a cup! Go check your emails ;)"
        redirect_to dashboard_cup_path(@cup)
        else
        redirect_to dashboard_path
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
    location_ids = Location.near([@pot.location.latitude, @pot.location.longitude], 5, units: :km).map(&:id)

    # FIXME: deal with canceled Cups
    friends_pots = Pot.joins(:pot_friends).where(
      user_id: @pot.friend_ids,
      location_id: location_ids,
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
      (:pot_time_10 = true AND time_10 = true) OR
      (:pot_time_12 = true AND time_12 = true) OR
      (:pot_time_2 = true AND time_2 = true) OR
      (:pot_time_4 = true AND time_4 = true) OR
      (:pot_time_6 = true AND time_6 = true)
      ", pot_time_10: @pot.time_10, pot_time_12: @pot.time_12, pot_time_2: @pot.time_2, pot_time_4: @pot.time_4, pot_time_6: @pot.time_6)

    # TODO: take one
    # matching_pot = friends_pots.order(:created_at).first
    matching_pot = friends_pots.sample
    # if there is one
    #   then ...
    return unless matching_pot

    # do we need this first line?
    if matching_pot.start_date == matching_pot.end_date
      date = start_date
    else
      matching_date = ((matching_pot.start_date)..(matching_pot.end_date)).to_a
      sender_pot_date = ((@pot.start_date)..(@pot.end_date)).to_a
      dates = matching_date & sender_pot_date
      matched_date = dates.sample
      date = matched_date
    end

    match_location = [matching_pot.location_id, @pot.location_id]
    location = match_location.sample

    matching_times = []

    %w(time_10 time_12 time_2 time_4 time_6).each do |time_column|
      if @pot[time_column] == true
        if (@pot[time_column] == matching_pot[time_column])
          matching_times << time_column
        end
      end
    end

    matching_time = matching_times.sample

    @cup = Cup.create!(
      time: matching_time,
      date: date,
      sender: current_user,
      receiver: matching_pot.user,
      location_id: location
    )
    @pot.update(cup: @cup)
    matching_pot.update(cup: @cup)

    UserMailer.cuppa_match(@user, matching_pot.user).deliver_now

  end


  def pot_params
    params.require(:pot).permit(:location_id, :datestring, :time_10, :time_6, :time_4, :time_2, :time_12)
  end

  def marker_string(location)
    <<~HEREDOC
      <div class='infomap-style'>
        <p>#{location.name}</p>
        <p>#{location.address}</p>
        <a href="#" class="btn btn-primary js-pot--select-location" data-location-id="#{location.id}" data-location-name="#{location.name}">SELECT</a>
      </div>
    HEREDOC
  end
end
