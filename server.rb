require 'sinatra/activerecord'
require 'sinatra'
set :port, 3000
require './models'
set :database, {adapter: "sqlite3", database: "./doggly.sqlite3"}
enable :sessions

get '/' do
  erb :home
end

get '/signup' do
#  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.new(params[:user])
  #@user.save
  if @user.valid?
    @user.save
  else
    redirect '/'
  end
  p params
#redirect '/profile'
end

get '/profile' do
  erb :profile
end
