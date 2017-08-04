class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @advices = @spot.advices
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      flash[:success] = "スポット作成ができました"
      redirect_to @spot
    else
      render 'new'
    end
  end

private
  def spot_params
    params.require(:spot).permit(:placeName, :lat, :lng, :picture)
  end

end
