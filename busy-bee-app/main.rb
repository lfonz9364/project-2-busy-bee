require "pry"
require "sinatra"
require "sinatra/reloader"
require "pg"
require_relative "database_config"

enable :sessions

helpers do

get '/' do
  erb :index
end
