class SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'article'
      if method == 'perfect'
        Article.where(title: content)
      elsif method == 'forward'
        Article.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Article.where('title LIKE ?', '%'+content)
      else
        Article.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
