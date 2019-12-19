require 'sinatra/activerecord'
require 'sinatra'
set :port, 3000
require './models'
set :database, {adapter: "sqlite3", database: "./doggly.sqlite3"}


get '/' do
  erb :home
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  p params
  redirect '/profile'
end

get '/profile' do
  erb :profile
end
