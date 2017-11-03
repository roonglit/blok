require 'rails_helper'

feature 'Article' do
  scenario 'user can see list of articles', js: true do
    visit root_path
    expect(page).to have_content 'Hello'
    # save_and_open_screenshot
  end
end
