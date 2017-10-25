class LikesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def create
    like = Like.find_by(user_id: current_user.id, advice_id: params[:advice_id])
    if like.blank?
      Like.create(user_id: current_user.id, advice_id: params[:advice_id])
    end
    @advice = Advice.find(params[:advice_id])
  end

  def destroy
    like = Like.find(params[:id])
    @advice = like.advice
    return unless current_user == like.user
    like.destroy
  end
end
