class SpotsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  def index
    @spots = Spot.search(params[:search])
  end

  def show
    @spot = Spot.find(params[:id])
    @sort_by = params[:sort_by];
    case @sort_by
    when "new"
      @advices = @spot.advices.order(created_at: :desc)
    else
      @advices = @spot.advices.order(likes_count: :desc)
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      flash[:success] = "スポット作成ができました"
      redirect_to @spot
    else
      render 'new'
    end
  end

private
  def spot_params
    params.require(:spot).permit(:place_name, :lat, :lng, :detail_comment)
  end

end
