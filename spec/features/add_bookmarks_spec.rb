require 'pg'

feature 'add new bookmarks' do
  scenario 'A user can add a new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/')
    fill_in :new_bookmark_title, with: 'steam'
    click_button('Submit')
    expect(page).to have_content 'steam'
  end
end