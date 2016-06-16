class Dashboard::PotFriendsController < ApplicationController

  def new
    @friends
    @pot_friend = PotFriend.new
  end

  def create
    @pot_friend = PotFriend.new(pot_friend_params)
    @pot_friend.save!
    redirect_to pot_friend_path(@pot_friend)
  end

  private

  def pot_friend_params
    params.require(:pot_friend).permit(:pot_id, :friend_id)
  end
end
