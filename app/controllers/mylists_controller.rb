class MylistsController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @mylist = @user.mylists
    @spot = Spot.all
  end
end
