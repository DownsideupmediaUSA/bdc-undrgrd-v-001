require './config/environment'

class ApplicationController < Sinatra::Base
 register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bdcmuzik secret"
  end

 get '/' do
  if logged_in?
   erb :index
  else
    redirect to '/signup'
  end
 end

 helpers do


    def logged_in?
      !!session[:artist_id]
    end

    def current_user
      @current_user ||= Artist.find(session[:artist_id])
    end

  end


end
