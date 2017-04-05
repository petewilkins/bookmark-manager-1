require 'sinatra/base'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello World!'
  end
  
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end
