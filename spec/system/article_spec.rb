require 'rails_helper'

describe 'article page' do
  scenario 'user can create an article' do
    visit '/'
    expect(page).to have_text('Create New Article')
  end
end
