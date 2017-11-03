class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.share.subject
  #
  def share(article_id, address)
    @greeting = "Hi"

    mail to: address, subject: 'Your friend has shared this article to you'
  end
end
