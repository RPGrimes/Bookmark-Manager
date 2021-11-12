require 'pg'

feature 'delete bookmarks' do
  scenario 'A user can delete a chosen bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.add('https://store.steampowered.com/', 'steam')
    visit('/bookmarks')
    expect(page).to have_link("steam", :href=>"https://store.steampowered.com/")
    find("[id='delete-1']").click
    expect(page).to_not have_link("steam", :href=>"https://store.steampowered.com/")
  end
end