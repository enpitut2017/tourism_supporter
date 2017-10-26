class MylistsController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @mylist = @user.mylists
    @spots = Spot.all
  end
end
