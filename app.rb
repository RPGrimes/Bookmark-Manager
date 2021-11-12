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

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/add-bookmark' do
    Bookmarks.add(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/delete-bookmark' do
    Bookmarks.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
