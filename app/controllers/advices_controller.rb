class AdvicesController < ApplicationController
  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new(advice_params)
    @advice.save
    redirect_to advices_new_path
  end

  def advice_params
    params.require(:advice).permit(:spot_id, :pictureURL, :comment)
  end
end
