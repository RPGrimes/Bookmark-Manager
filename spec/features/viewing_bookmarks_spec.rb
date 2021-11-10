require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    # Add the test data
    Bookmarks.add('http://www.makersacademy.com', 'makers')
    Bookmarks.add('http://www.destroyallsoftware.com', 'destroy all software')
    Bookmarks.add('http://www.google.com', 'google')

    visit('/bookmarks')

    #expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "makers"
    #expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "destroy all software"
    #expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "google"
  end
end