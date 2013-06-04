require 'spec_helper'

describe 'Creating an issue' do
  # As a user
  # I want to create an issue
  # So developers can address those issues

  # Acceptance Criteria:
  # * I must specify a title
  # * I must specify a category
  # * I must specify a severity
  # * I can optionally specify that the bug is reproducible
  it 'adds an issue when I specify valid information' do
    FactoryGirl.create(:category, name: 'Bug')
    FactoryGirl.create(:category, name: 'Feature Request')
    prev_count = Issue.count

    visit '/issues/new'
    fill_in 'Title', with: 'An Issue'
    fill_in 'Description', with: 'A description'
    check 'Is reproducible'
    select 'Bug', from: 'Category'
    choose 'Moderate'
    click_button 'Create Issue'

    expect(Issue.count).to eql(prev_count + 1)
  end
end
