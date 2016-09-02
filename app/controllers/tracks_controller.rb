require 'rack-flash'
class TracksController < ApplicationController
use Rack::Flash 

get '/tracks' do
  if logged_in?
    @tracks = Track.all  
    erb :'/tracks/tracks'
  else
    redirect to '/login'
  end
end

get '/tracks/new' do
  if logged_in?
    erb :'/tracks/new_track'
  else
    redirect to '/login'
  end
end

post '/tracks' do
  if params[:title] == ""
    redirect to "/tracks/new"
  else
    @track = Track.create(:title =>params["Title"])
    artist = Artist.find_by_id(current_artist.id) 

    
   
    @track.save

  flash[:message] = "Successfully created track"
  redirect("/tracks/#{@track.id}")
  end
end

# get '/tracks/:slug' do 
#   if session[:user_id] 
#     @track = track.find_by_slug(params[:slug])
#     erb :'track/show_track'
#   else
#     redirect to '/login'
#   end
# end

get '/tracks/:id' do
  if logged_in?
    @track = Track.find_by_id(params[:id])
    erb :'tracks/show_track'
  else 
    redirect to '/login'
  end
end



get '/tracks/:id/edit' do
  @track = Track.find_by_id(params[:id])
  erb :'tracks/edit'
end

patch '/tracks/:id/edit' do
  @track = Track.find_by_id(params[:id])
  @track.update(params[:track])
  @track.artist = Artist.find_or_create_by(name: params[:artist][:name])
  @track.save
  flash[:message] = "Successfully updated song."
  redirect("/artists/#{@track.id}")
end

delete '/tracks/:id/delete' do 
    @track = Track.find_by_id(params[:id])
  if logged_in?
    @track = Track.find_by_id(params[:id])
  if @track.artist_id == current_artist.id
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