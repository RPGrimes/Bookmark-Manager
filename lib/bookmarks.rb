require 'pg'

class Bookmarks

  def self.all
    connection = PG.connect :dbname => 'postgres'
    result = connection.exec "SELECT * FROM bookmarks"
    result.map do |bookmark|
      bookmark['url']
    end
  end

end
