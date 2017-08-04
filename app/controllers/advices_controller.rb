class AdvicesController < ApplicationController

  def new
    @spot = Spot.find(params[:spot_id])
    @advice = @spot.advices.build
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @advice = @spot.advices.build(advice_params)
    @advice.save

    redirect_to controller: 'spots', action: 'show', id: @advice.spot_id
  end

  def advice_params
    params.require(:advice).permit(:spot_id, :picture, :comment)
  end

end
