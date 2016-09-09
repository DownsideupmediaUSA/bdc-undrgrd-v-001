class MixesController < ApplicationController

 
use Rack::Flash 

get '/mixes' do
  if logged_in?
    @mixes = Mix.all  
    erb :'/mixes/mixes'
  else
    redirect to '/login'
  end
end

get '/mixes/new' do
  if logged_in?
    erb :'/mixes/new_mix'
  else
    redirect to '/login'
  end
end

get '/mixes/:id' do
  if logged_in?
    @mix = Mix.find_by_id(params[:id])
    erb :'mixes/show_mix'
  else 
    redirect to '/login'
  end
end

post '/mixes' do
  if params[:title] == ""
    redirect to "/mixes/new_mix"
  else
    artist = Artist.find_by_id(session[:artist_id])
    @mix = Mix.create(:title => params[:title], :artist_id => artist.id)
    # @track.artist = Artist.find_or_create_by(:name => artist.name)
   
    @mix.save
    flash[:message] = "Successfully added mix"
    redirect("/mixes/#{@mix.id}")
  end
end





# get '/mixes/:slug' do 
#   if session[:user_id] 
#     @mix = mix.find_by_slug(params[:slug])
#     erb :'mix/show_mix'
#   else
#     redirect to '/login'
#   end
# end



get '/mixes/:id/edit' do
  if logged_in?
    @mix = Mix.find_by_id(params[:id])
  if @mix.artist_id == current_user.id
    erb :'mixes/edit'
  else 
    flash[:message] = "Nice try buddy..this isnt your mix!"
    redirect to '/mixes'
  end
  else 
    redirect to '/login'
  end
end

patch '/mixes/:id' do
  if params[:title] == ""
    redirect to "/mixes/#{params[:id]}/edit"
  else
    @mix = Mix.find_by_id(params[:id])
    @mix.title = params[:title]
    @mix.save
    flash[:message] = "Successfully updated mix!"
    redirect("/mixes/#{@mix.id}")
  end
end

delete '/mixes/:id/delete' do 
  if logged_in?
    @mix = Mix.find_by_id(params[:id])
  if @mix.artist_id == current_user.id
    @mix.delete
    redirect to '/mixes'
  else
    flash[:message] = "Nice try buddy..this isnt your mix!"
    redirect to '/mixes'
  end
  else
    redirect to '/login'
  end
end



end
