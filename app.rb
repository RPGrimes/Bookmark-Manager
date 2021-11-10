require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/new-bookmark' do
    Bookmarks.add(params[:new_bookmark_name])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    ENV
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0
end
