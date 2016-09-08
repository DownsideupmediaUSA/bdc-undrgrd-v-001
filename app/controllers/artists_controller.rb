class ArtistsController < ApplicationController

  get 'artists/:id' do 
    if !logged_in?
      redirect '/login'
    end

  @artist = Artist.find(params[:id])
    if !@artist.nil? && @artist == current_user
      erb :'artists/show' 
    else
      redirect 'tracks'
    end
  end

  get '/signup' do 
    if !logged_in?
      erb :'/artists/create_artists', locals: {message: "You have to sign up to get in ya dig?"}
    else
      redirect to '/artists/show'
    end
  end

  post '/signup' do 
    if params[:artist_name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @artist = Artist.new(:username => params[:username], :artist_name => params[:artist_name], :email => params[:email], :password => params[:password])
      @artist.save
      session[:artist_id] = @artist.id
      erb :'artists/show'
    end
  end

  get '/login' do
    if !session[:artist_id]
      erb :'artists/login'
    else
      redirect '/show'
    end
  end
  
  get '/show' do
    artist = Artist.all
    erb :'artists/show'
  end

  post '/login' do
      artist = Artist.find_by(:username => params[:username])
    if artist && artist.authenticate(params[:password])
      session[:artist_id] = artist.id
      redirect "/"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:artist_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end