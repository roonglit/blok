require 'rails_helper'

describe 'article page' do
  scenario 'user can create an article', js: true do
    visit '/'
    expect(page).to have_text('Hello')
  end
end
