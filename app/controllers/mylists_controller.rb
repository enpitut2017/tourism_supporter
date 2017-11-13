class MylistsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @mylist = current_user.mylists
  end

  def create
    @mylist = Mylist.new(spot_id: params[:spot_id],user_id: current_user.id)
    if @mylist.save
    end
    @spot = Spot.find(params[:spot_id])
  end

  def destroy
    @spot = Spot.find(params[:id])
    @mylist = Mylist.find_by(user_id: current_user.id, spot_id: @spot.id)
    if @mylist.destroy
    end
  end
end
