require 'pg'

feature 'update bookmarks' do
  scenario 'A user can update a chosen bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.add('https://store.steampowered.com/', 'steam')
    visit('/bookmarks')
    within('div#bookmark-1') do
      click_button "Update"
    end
    fill_in :title, with: 'steam'
    click_button "Submit"
    expect(page).to have_link("steam", :href=>"https://store.steampowered.com/") 
  end
end