class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favorite = @article.favorites.new(member_id: current_member.id)
    favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_member.favorites.find_by(article_id: @article.id)
    favorite.destroy
  end
end
