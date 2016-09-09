class ArtistsController < ApplicationController

  use Rack::Flash

  get '/artists' do
    if logged_in?
      @artists = Artist.all  
      erb :'/artists/artists'
    else
      redirect to '/login'
    end
  end

  get '/artists/:id' do 
    if !logged_in?
      @artist = Artist.find_by_id(params[:id])
    if !@artist.nil? && @artist == current_user
      erb :'artists/show' 
    else
      redirect 'artists'
    end
    else 
      redirect '/login'
    end
  end

  get '/show' do
    if logged_in?
      @artist = Artist.find_by_id(params[:id])
    if @artist_id == current_user.id 
      erb :'artists/show'
    end
    else
      redirect '/login'
    end
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

  delete '/artists/:id/delete' do 
    if logged_in?
      @artist = Artist.find_by_id(params[:id])
    if @artist_id == current_user.id
      @artist.delete
      redirect to '/artists'
    else
      flash[:message] = "Nice try buddy..this isnt you!!!"
      redirect to '/artists'
    end
    else
      redirect to '/login'
    end
  end

  

end