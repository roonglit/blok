require 'rails_helper'

feature 'Article' do
  context 'articles exists' do
    before { create(:article) }

    scenario 'user can see list of articles' do
      visit root_path
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Article Title'
      expect(page).to have_content "This is article's body"
      # save_and_open_screenshot
    end
  end
end
