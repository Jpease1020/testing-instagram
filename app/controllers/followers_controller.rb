class FolloersController < ApplicationController
  def index
    @friends = Friend.all
  end
end
