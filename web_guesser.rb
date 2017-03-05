require 'sinatra'
require 'sinatra/reloader'


NUMBER = rand(99)

get '/' do
  "THE SECRET NUM IS: #{NUMBER}"
end