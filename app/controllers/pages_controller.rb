
class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @cup = Cup.create
    CupMailer.cuppa_match(@cup, current_user).deliver_now
  end

end

