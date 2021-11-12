require 'pg'

feature 'delete bookmarks' do
  scenario 'A user can delete a chosen bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.add('https://store.steampowered.com/', 'steam')
    Bookmarks.add('https://google.com/', 'Google')
    visit('/bookmarks')
    expect(page).to have_link("steam", :href=>"https://store.steampowered.com/")
    expect(page).to have_link("Google", :href=>"https://google.com/")
    page.should have_css('div#bookmark-1')
    within('div#bookmark-1') do
      click_button "Delete"
    end
    expect(page).to_not have_link("steam", :href=>"https://store.steampowered.com/")
    expect(page).to have_link("Google", :href=>"https://google.com/")
  end
end