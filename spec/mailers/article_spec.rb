require "rails_helper"

RSpec.describe ArticleMailer, type: :mailer do
  xdescribe "share" do
    let(:mail) { ArticleMailer.share }

    it "renders the headers" do
      expect(mail.subject).to eq("Share")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
