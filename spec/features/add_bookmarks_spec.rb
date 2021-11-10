require 'pg'

feature 'add new bookmarks' do
  scenario 'A user can add a new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/')
    fill_in :new_bookmark_name, with: 'http://www.steam.com'
    click_button('Submit')
    expect(page).to have_content 'http://www.steam.com'
  end
end