class UsersController < ApplicationController

  get 'users/:slug' do 
    @user = User.find_by_slug(params[:slug])
    erb :'users/show' 
  end

  get '/signup' do 
    if !session[:user_id]
      erb :'/users/create_user', locals: {message: "You have to sign in to get in ya dig?"}
    else
      redirect to '/show'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      erb :'/users/show'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/show'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/show"
    else
      redirect to '/signup'
    end
  end

  get '/show' do
    if !session[:user_id]
    erb :'/users/show'
    else
      redirect to '/login'
    end
  end
 
  get '/logout' do
    if logged_in? != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end



