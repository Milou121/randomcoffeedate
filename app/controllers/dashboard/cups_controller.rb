class Dashboard::CupsController < ApplicationController
  def index
    @cups = current_user.cups.all
  end

  def show
    @cup = current_user.cups.find(params[:id])
  end

  def accept
    @cup = @cup.update(status: "accept")
    redirect_to dashboard_path
  end

  def deny
    @cup = @cup.update(status: "deny")
    redirect_to dashboard_path
  end

  def cancel
  end
end
