class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    redirect_to action: 'index'
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
