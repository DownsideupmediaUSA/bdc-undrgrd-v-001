require 'rack-flash'
class TracksController < ApplicationController
use Rack::Flash 

get '/tracks' do
  if session[:user_id] 
    @tracks = Track.all  
    erb :'/tracks/tracks'
  else
    redirect to '/login'
  end
end

get '/tracks/new' do
  if session[:user_id] 
    erb :'/tracks/new_track'
  else
    redirect to '/login'
  end
end

get '/tracks/:slug' do 
  if session[:user_id] 
    @track = track.find_by_slug(params[:slug])
    erb :'track/show_track'
  else
    redirect to '/login'
  end
end

get '/tracks/:id' do
  if session[:user_id]
    @track = Track.find_by_id(params[:id])
    erb :'tracks/show_track'
  else 
    redirect to '/login'
  end
end

post '/tracks' do
  if params[:title] == ""
    redirect to "/tracks/new"
  else
    user = User.find_by_id(session[:user_id]) 
    @track = Track.create(:title => params["Title"])
   
    @track.save

  flash[:message] = "Successfully created track"
  redirect("/tracks/#{@track.slug}")
  end
end

get '/tracks/:slug/edit' do
  @track = Track.find_by_slug(params[:slug])
  erb :'tracks/edit'
end

patch '/tracks/:slug/edit' do
  @track = Track.find_by_slug(params[:slug])
  @track.update(params[:track])
  @track.user = User.find_or_create_by(name: params[:user][:name])
  @track.save
  flash[:message] = "Successfully updated song."
  redirect("/songs/#{@song.slug}")
end

delete '/tracks/:id/delete' do 
    @track = Track.find_by_id(params[:id])
  if session[:user_id]
    @track = Track.find_by_id(params[:id])
  if @track.user_id == session[:user_id]
    @track.delete
    redirect to '/tracks'
  else
    redirect to '/tracks'
  end
  else
    redirect to '/login'
  end
end


end