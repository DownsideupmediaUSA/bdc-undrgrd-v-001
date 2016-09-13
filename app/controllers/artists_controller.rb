require 'rack-flash'
class ArtistsController < ApplicationController

  use Rack::Flash

  get '/artists/all-tracks' do
    @tracks = Track.all
    erb :'artists/all_tracks'
  end


  get '/show' do

  @tracks = Track.all.where("artist_id = ?", current_user.id)
  @mixes = Mix.all.where("artist_id = ?", current_user.id)
    erb :'artists/show'
  end


  get '/artists' do
    if logged_in?
      @artists = Artist.all
      erb :'/artists/index'
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
      redirect '/artists/index'
    end
    else
      redirect '/login'
    end
  end

  delete '/artists/:id/delete' do
    if logged_in?
      @artist = Artist.find_by_id(params[:id])
    if @artist_id == current_user.id
      @artist.delete
      redirect to '/artists/index'
    else
      flash[:message] = "Nice try buddy..this isnt you!!!"
      redirect to '/artists'
    end
    else
      redirect to '/login'
    end
  end



end
