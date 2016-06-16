class LocationController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @alert_message = "You are viewing #{@location.name}"
  end
end
