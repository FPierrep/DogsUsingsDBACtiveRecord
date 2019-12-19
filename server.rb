require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
set :port, 3000
require './models'
set :database, {adapter: "sqlite3", database: "./doggly.sqlite3"}
enable :sessions

get '/' do
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  given_password = params[:password]
  if user.password == given_password
    session[:user_id] == user.id
    redirect '/profile'
  else
    flash[:error] = "Did you mean: #{user.password} "
    redirect '/login'
  end
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
    redirect '/profile'
  else
  #  flash[:error] = "You hava not provided an email and password"
    flash[:error] = @user.errors.full_messages
    redirect '/signup'
  end
#redirect '/profile'
end

get '/profile' do
  redirect '/' unless session[:user_id]
  erb :profile
end
