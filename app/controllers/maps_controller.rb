class MapsController < ApplicationController

  def new
    @spot = Spot.find(params[:spot_id])
    @latitude = @spot.lat
    @longitude = @spot.lng
  end
end
