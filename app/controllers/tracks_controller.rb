require 'rack-flash'
class TracksController < ApplicationController
use Rack::Flash

get '/tracks' do
  if logged_in?
    @tracks = Track.all.where("artist_id = ?", current_user.id)
    erb :'/tracks/index'
  else
    redirect to '/login'
  end
end


get '/tracks/new' do
  if logged_in?
    erb :'/tracks/new'
  else
    redirect to '/login'
  end
end


post '/tracks' do
  if params[:title] == ""
    redirect to "/tracks/new_track"
  else
    track = current_user.tracks.create(title: params[:title])
    if track.save
      flash[:message] = "Successfully created track"
      redirect("/tracks/#{track.id}")
    else
      redirect to '/tracks/new'
    end
  end
end

get '/tracks/:id' do
  if logged_in?
    @track = Track.find(params[:id])
    erb :'tracks/show'
  else
    redirect to '/login'
  end
end


get '/tracks/:id/edit' do
  if logged_in?
    @track = Track.find_by_id(params[:id])
  if @track.artist_id == current_user.id
    erb :'tracks/edit'
  else
    flash[:message] = "Nice try buddy..chose one of your own!"
    redirect to '/artists/show'
  end
  else
    redirect to '/login'
  end
end

patch '/tracks/:id' do
  if params[:title] == ""
    redirect to "/tracks/#{params[:id]}/edit"
  else
    @track = Track.find_by_id(params[:id])
    @track.title = params[:title]
    @track.save
    flash[:message] = "Successfully updated track!"
    redirect("/tracks/#{@track.id}")
  end
end

delete '/tracks/:id/delete' do
  if logged_in?
    @track = Track.find_by_id(params[:id])
  if @track.artist_id == current_user.id
    @track.delete
    redirect to '/tracks'
  else
    flash[:message] = "Nice try buddy..this isnt your track!"
    redirect to '/tracks'
  end
  else
    redirect to '/login'
  end
end


end
