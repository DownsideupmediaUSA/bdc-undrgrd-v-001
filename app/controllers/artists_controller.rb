require 'rack-flash'
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
      erb :'/artists/show' 
    else
      redirect 'artists'
    end
    else 
      redirect '/login'
    end
  end

  get '/show' do
    if logged_in?
    @tracks = Track.all 
    erb :'/artists/show'
    else
    redirect to '/login'
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