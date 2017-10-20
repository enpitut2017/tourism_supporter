class AdvicesController < ApplicationController
  include AdvicesHelper
  before_action :logged_in_user, only: [:new, :create]

  def new
    @spot = Spot.find(params[:spot_id])
    @advice = @spot.advices.build
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @advice = @spot.advices.build(advice_params)
    @advice = insert_place @advice if params[:picture] != nil
    @advice.user = current_user
    if @advice.save
      redirect_to controller: 'spots', action: 'show', id: @advice.spot_id
    else
      render 'new'
    end
  end

  def show
    @advice = Advice.find(params[:id])
  end

  def advice_params
    params.require(:advice).permit(:spot_id, :picture, :comment)
  end
end
