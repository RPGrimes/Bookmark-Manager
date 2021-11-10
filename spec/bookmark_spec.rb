require 'bookmarks'

describe '#all' do
  it 'returns a list of all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    #Add the test data
    Bookmarks.add('http://www.makersacademy.com')
    Bookmarks.add('http://www.destroyallsoftware.com')
    Bookmarks.add('http://www.google.com')

    bookmarks = Bookmarks.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end