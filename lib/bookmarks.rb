require 'pg'

class Bookmarks

  # def self.environment
  #   if ENV['RACK_ENV'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect :dbname => 'bookmark_manager'
  #   end
  # end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec "SELECT * FROM bookmarks;"
    result.map do |bookmark|
      bookmark['url']
    end
  end

  def self.add(new_bookmark_name)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{new_bookmark_name}');")
  end

end
