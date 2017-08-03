class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
    @advices = @spot.advices
  end
end
