require 'pg'

feature 'add new bookmarks' do
  scenario 'A user can add a new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/')
    fill_in :title, with: 'steam'
    fill_in :url, with: 'https://store.steampowered.com/'
    click_button('Submit')
    expect(page).to have_link("steam", :href=>"https://store.steampowered.com/")
  end
end