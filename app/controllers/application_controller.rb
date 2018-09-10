require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(params)
    if !@user
      erb :error
    else
      session[:user_id] = @user.id
      redirect to '/account'
      
      erb :account
    end
  end

  get '/account' do
  
  end

  get '/logout' do

  end


end

