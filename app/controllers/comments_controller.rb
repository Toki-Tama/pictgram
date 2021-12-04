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
      #redirect_to xxxx_path, (notice,alert,success)でフラッシュメッセージを設定し表示させることがでできる。
      #viewファイルには<%= (notice,alert,success) %> と記述する。
    else
      redirect_to topics_path, danger: 'コメント投稿を失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description, :topic_id)
    #なぜここにuser_idがないのか、user.idはsessionでユーザーごとにsessionが指定される。
    #前のリクエスト情報を次のリクエストでも利用できるように小さなデータを保存できる。
    #Coockieなどに保存される。
    #sessionデータはviewsとcomtrollerでのみ利用でき、modelでは直接呼び出せない。
  end
end