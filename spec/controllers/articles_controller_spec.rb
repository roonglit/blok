require 'rails_helper'

describe ArticlesController do
  describe 'POST /:id/share' do
    context 'an article exists' do
      before {@article = create(:article)}

      it 'sends email sharing the article' do
        post :share, params: {id: @article.id, email: 'test@test.com'}
        mails = ActionMailer::Base.deliveries
        expect(mails.length).to eq 1
        expect(mails[0].to).to include('test@test.com')
        expect(mails[0].subject).to eq 'Your friend has shared this article to you'
      end
    end
  end
end
