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

describe '.update' do
  it 'updates the bookmark with the given data' do
    bookmark = Bookmarks.add(title: 'Google', url: 'http://www.google.com')
    updated_bookmark = Bookmarks.update(id: bookmark.id, url: 'http://www.hoogle.com', title: 'Hoogle')

    expect(updated_bookmark).to be_a Bookmarks
    expect(updated_bookmark.id).to eq bookmarks.id
    expect(updated_bookmark.title).to eq 'Hoogle'
    expect(updated_bookmark.url).to eq 'http://www.hoogle.com'
  end
end

describe '.find' do
  it 'returns the requested bookmark object' do
    bookmark = Bookmarks.add(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    result = Bookmarks.find(id: bookmark.id)

    expect(result).to be_a Bookmark
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end
