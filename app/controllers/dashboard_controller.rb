class DashboardController < ApplicationController

  attr_reader :service
  def service ###### would it be more appropriate to make this a private method????????
    @service = InstagramService.new(current_user)
  end

  def index
    @user = User.find(current_user)
    @golden_grams = service.all
  end
end
