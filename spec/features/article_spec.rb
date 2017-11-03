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

    scenario 'user can edit an article' do
      visit root_path
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Article Title'
      expect(page).to have_content "This is article's body"
      click_link 'Edit'
      fill_in 'article[title]', with: 'New Article Name'
      fill_in 'article[body]', with: 'This is interesting'
      click_button 'Save'
      expect(page).to have_content 'New Article Name'
      expect(page).to have_content 'This is interesting'
    end

    scenario 'user can delete an article' do
      visit root_path
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Article Title'
      expect(page).to have_content "This is article's body"
      click_link 'Delete'
      expect(page).not_to have_content 'Article Title'
      expect(page).to have_content 'Hello'
    end

    context 'another article exists' do
      before { create(:article, title: 'Second Article') }

      scenario 'user can edit second article' do
        visit root_path
        expect(page).to have_content 'Hello'
        expect(page).to have_content 'Article Title'
        expect(page).to have_content 'Second Article'

        within(all('.article')[1]) do
          expect(page).to have_content 'Second Article'
          click_link 'Edit'
        end

        fill_in 'article[title]', with: 'New Article Name'
        fill_in 'article[body]', with: 'This is interesting'
        click_button 'Save'

        expect(page).to have_content 'Article Title'
        expect(page).not_to have_content 'Second Article'
        expect(page).to have_content 'New Article Name'
        expect(page).to have_content 'This is interesting'
      end
    end
  end

  scenario 'user can create an article' do
    visit root_path
    click_link 'Create New Article'
    fill_in 'article[title]', with: 'New Article'
    fill_in 'article[body]', with: 'Hey ho'

    image = Rails.root.join('spec/fixtures', 'sample.jpg')
    attach_file('article[image]', image)

    click_button 'Save'

    expect(page).to have_content 'Hello'
    expect(page).to have_content 'New Article'
    expect(page).to have_content 'Hey ho'

    click_link 'New Article'
    expect(page).to have_css("img[src*='sample.jpg']")
  end
end
