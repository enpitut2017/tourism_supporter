class CommentsController < ApplicationController
  def create
    @advice = Advice.find(params[:advice_id])
    @comment = @advice.comments.build(comment_params)
    @comment.user = current_user
    unless @comment.save
      flash[:faild] = "コメントの作成に失敗しました"
    end
    redirect_to advice_path(id: @advice.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "comment deleted"
    else
      flash[:failed] = "comment destroy failed"
    end
    redirect_to advice_path(@comment.advice)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
