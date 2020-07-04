class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_member.articles.new(article_params)
    if @article.save
      redirect_to articles_path, success: '記事を作成しました！'
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), warning: '記事を更新しました！'
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, danger: '記事を削除しました。'
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end
end
