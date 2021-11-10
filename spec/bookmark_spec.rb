require 'bookmarks'

describe '#all' do
  it 'returns a list of all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    #Add the test data
    Bookmarks.add('http://www.makersacademy.com', 'makers')
    Bookmarks.add('http://www.destroyallsoftware.com', 'destroy all software')
    Bookmarks.add('http://www.google.com', 'google')

    bookmarks = Bookmarks.all

    expect(bookmarks).to include(["http://www.makersacademy.com", "makers"])
    expect(bookmarks).to include(["http://www.destroyallsoftware.com", "destroy all software"])
    expect(bookmarks).to include(["http://www.google.com", "google"])
  end
end
