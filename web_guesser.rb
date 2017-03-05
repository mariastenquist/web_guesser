require 'sinatra'
require 'sinatra/reloader'


number = rand(99)

get '/' do
  erb :index, :locals => {:number => number}
end