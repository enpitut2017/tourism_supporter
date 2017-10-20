class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, advice_id: params[:advice_id])
    @likes = Like.where(advice_id: params[:advice_id])
    @advices = Advice.all
    @advice = Advice.find(params[:advice_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, advice_id: params[:advice_id])
    like.destroy
    @likes = Like.where(advice_id: params[:advice_id])
    @advices = Advice.all
    @advice = Advice.find(params[:advice_id])    
  end
end
