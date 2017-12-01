class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, advice_id: params[:advice_id])
    if @comment.save
      redirect_to advice_path(params[:advice_id])
    else
      flash[:faild] = "コメントの作成に失敗しました"
      redirect_to advice_path(params[:advice_id])
    end
  end

  def destroy
  end

  def update
  end
end
