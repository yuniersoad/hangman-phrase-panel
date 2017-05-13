require 'sinatra'
require './config'
require './lib/phrases'

get '/' do
  @phrases = PhrasesService.list_all()
  erb :index
end

