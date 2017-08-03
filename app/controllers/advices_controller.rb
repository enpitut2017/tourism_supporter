class AdvicesController < ApplicationController

  def new
    @advice = Advice.new
    @spot_id = params[:spot_id]
  end

  def create
    @advice = Advice.new(advice_params)
    @advice.save

    redirect_to controller: 'spots', action: 'show', id: @advice.spot_id
  end

  def advice_params
    params.require(:advice).permit(:spot_id, :pictureURL, :comment)
  end

end
