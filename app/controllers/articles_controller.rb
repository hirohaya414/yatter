class ArticlesController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  before_action :baria_member, only: [:edit, :update]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @articles_all = @category.articles
      @articles = @category.articles.page(params[:page]).reverse_order
    else
      @articles_all = Article.all
      @articles = Article.page(params[:page]).reverse_order
    end
  end

  def show
    @article = Article.find(params[:id])
    @member = @article.member
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

  def baria_member
    article = Article.find(params[:id])
    unless article.member == current_member
      redirect_to articles_path
    end
  end

end
