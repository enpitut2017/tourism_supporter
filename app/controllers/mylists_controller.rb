class MylistsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @mylist = current_user.mylists
  end

  def create
    @mylist = Mylist.new(spot_id: params[:spot],user_id: current_user.id)
    if @mylist.save
      @word = "マイリストから削除"
    end
    @spot = Spot.find(params[:spot_id])
  end

  def destroy
    @spot = Spot.find(params[:spot_id]);
    @mylist = @spot.mylists
    if @mylist.destroy
      @word = "マイリストへ追加"
    end
  end
end
