class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: 'コメントをしました'
    else
      redirect_to topics_path, danger: 'コメント投稿を失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :topic_id)
  end
end