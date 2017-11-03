# Preview all emails at http://localhost:3000/rails/mailers/article
class ArticlePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article/share
  def share
    article = Article.first
    ArticleMailer.share(article.id, 'test@test.com')
  end

end
