class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, advice_id: params[:advice_id])
    @advice = Advice.find(params[:advice_id])
  end

  def destroy
    like = Like.find(params[:id])
    @advice = like.advice
    like.destroy
  end
end
