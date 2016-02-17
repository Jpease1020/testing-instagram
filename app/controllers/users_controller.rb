class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
    @most_recent_post = UserGrams.most_recent_post(current_user)
    byebug
  end
end
