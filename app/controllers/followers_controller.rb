class FollowersController < ApplicationController
  def index
    @followers = Follower.all(current_user)
  end
end
