class CommentsController < ApplicationController
  def create
  	article = Article.find(params[:article_id])
    @comment = current_member.comments.new(comment_params)
    @comment.article_id = article.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
  	Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
  	redirect_to request.referer
  end

  private
  def comment_params
  	params.require(:comment).permit(:content)
  end
end
