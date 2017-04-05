ENV['RACK_ENV']||= 'development'
require 'sinatra/base'
require './app/models/link.rb'
require './app/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello World!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end
end
