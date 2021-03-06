class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)

    redirect_to action: 'index'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to action: 'index'
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to action: 'index'
  end

  def share
    @article = Article.find(params[:id])
    ArticleMailer.share(@article.id, params[:email]).deliver_now
    flash[:notice] = "This article will be sent to #{params[:email]}"
    redirect_to action: 'index'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end
