class RelationsController < ApplicationController
  before_action :authenticate_user!, only: [:follow]

  def following_follower
    user = User.find params[:id]
    if params[:follower]
      @followers = user.followers
    else
      @followings = user.followings
    end
  end

  def follow
    @user = User.find params[:id]
    if current_user.following?(@user)
      current_user.unfollow!(@user)
    else
      current_user.follow!(@user)
    end
  end

end
