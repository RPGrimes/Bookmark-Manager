require 'bookmarks'

describe '#all' do
  it 'returns a list of all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    #Add the test data
    Bookmarks.add('http://www.makersacademy.com', 'makers')
    Bookmarks.add('http://www.destroyallsoftware.com', 'destroy all software')
    Bookmarks.add('http://www.google.com', 'google')

    bookmarks = Bookmarks.all
    
    expect(bookmarks.length).to eq 3
    expect(bookmarks[0].title).to include("makers")
    expect(bookmarks[1].url).to include("http://www.destroyallsoftware.com")
  end
end
