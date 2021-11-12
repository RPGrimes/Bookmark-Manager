require 'pg'

feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmarks.add(url: 'http://www.google.com', title: 'Google')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end