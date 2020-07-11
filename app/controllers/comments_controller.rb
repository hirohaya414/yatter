class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_member.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:article_id])
    @article = @comment.article
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
