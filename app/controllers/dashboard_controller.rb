class DashboardController < ApplicationController
  def index
    @user = User.find(current_user)
    @most_recent_post = UserGrams.most_recent_post(current_user)
  end
end
