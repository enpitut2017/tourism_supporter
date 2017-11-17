class AdvicesController < ApplicationController
  include AdvicesHelper
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

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

  def edit
    @advice = Advice.find(params[:id])
  end

  def update
    @advice = Advice.find(params[:id])
    if @advice.update_attributes(advice_params)
       redirect_to controller: 'advices', action: 'show', id: @advice.id
    else
      render 'edit'
    end
  end

  def destroy
    @advice.destroy
    flash[:success] = "advide deleted"
    redirect_to controller: 'spots', action: 'show', id: @advice.spot_id
  end

private
  def advice_params
    params.require(:advice).permit(:spot_id, :picture, :comment)
  end

  def correct_user
      @advice = current_user.advices.find_by(id: params[:id])
      redirect_to root_url if @advice.nil?
    end
end
