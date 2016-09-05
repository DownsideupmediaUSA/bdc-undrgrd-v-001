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
    redirect to "/tracks/new_track"
  else
    artist = Artist.find_by_id(session[:artist_id]) 
    @track = Track.create(:title => params[:title], :artist_id => artist.id)
    flash[:message] = "Successfully created track"
    redirect("/tracks/#{@track.id}")
  end
end

get '/tracks/:id' do
  if logged_in?
    @track = Track.find_by_id(params[:id])
    erb :'tracks/show_track'
  else 
    redirect to '/login'
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



get '/tracks/:id/edit' do
  if logged_in?
    @track = Track.find_by_id(params[:id])
  if @track.artist_id == current_user.id
    erb :'tracks/edit'
  else 
    flash[:message] = "Nice try buddy..this isnt your track!"
    redirect to '/tracks'
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