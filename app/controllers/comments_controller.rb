class CommentsController < ApplicationController

  def create
  @post = Post.find(params[:post_id])
  @post.comments.create(comment_params)
  redirect_to post_path(@post)
  # 個別の記事を取得している
  # rails routesでpost_idを参照してるのでparams[]の中にはpost_idと入れるのである
  end

  def destroy
    @post = Post.find(params[:post_id])
    # 記事を特定するpost_id
    @comment = @post.comments.find(params[:id])
    # comment_idということ！？
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
