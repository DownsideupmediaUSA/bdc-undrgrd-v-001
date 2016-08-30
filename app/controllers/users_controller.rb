class UsersController < ApplicationController

  get 'users/:slug' do 
    @user = User.find_by_slug(params[:slug])
    erb :'users/show' 
  end

  get '/signup' do 
    if !session[:user_id]
      erb :'/users/create_user', locals: {message: "You have to sign in to get in ya dig?"}
    else
      redirect to '/users/index'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/users/index'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect :'users/index'
    end
  end
 


end



