require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  
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

  get '/bookmarks/:id/edit' do
    @bookmarks_id = params[:id]
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmarks = Bookmarks.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  run! if app_file == $0
end
