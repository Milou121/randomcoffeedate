class Dashboard::CupsController < ApplicationController
  def index
    @cups = current_user.all_cups.all
  end

  def show
    @cup = current_user.all_cups.find(params[:id])
  end

  def cancel
    @cup = current_user.all_cups.where(status: "confirmed").find(params[:id])
    @cup.status = "canceled"
    @cup.canceled_by = current_user
    @cup.save
    @sad_person = current_user == @cup.sender ? @cup.receiver : @cup.sender
    #todo : mailer send a canceled mail to other person
    # Mailer.
    redirect_to dashboard_path
  end
end
