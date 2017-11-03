require 'rails_helper'

feature 'Article' do
  context 'articles exists' do
    before { create(:article) }

    scenario 'user can see list of articles' do
      visit root_path
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Article Title'
      expect(page).to have_content "This is article's body"
    end
  end

  scenario 'user can create an article' do
    visit root_path
    click_link 'Create New Article'
    fill_in 'article[title]', with: 'New Article'
    fill_in 'article[body]', with: 'Hey ho'
    click_button 'Save'
    expect(page).to have_content 'Hello'
    expect(page).to have_content 'New Article'
    expect(page).to have_content 'Hey ho'
  end
end
