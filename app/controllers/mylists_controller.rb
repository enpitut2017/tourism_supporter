class MylistsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @mylist = current_user.mylists
  end

  def create
    @mylist = Mylist.new(spot_id: params[:sp_id],user_id: current_user.id)
    if @mylist.save
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
      end

  end

  def destroy
    @mylist = Mylist.find_by(spot_id: params[:sp_id],user_id: current_user.id)
    if @mylist.destroy
      redirect_to user_path(current_user)
    end
  end
end
