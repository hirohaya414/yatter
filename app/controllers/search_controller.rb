class SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'member'
      if method == 'perfect'
        Member.where(name: content)
      elsif method == 'forward'
        Member.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Member.where('name LIKE ?', '%'+content)
      else
        Member.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'article'
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
