class DashboardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @grams = Instagram.all(current_user)
  end
end
