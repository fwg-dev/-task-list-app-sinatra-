class UsersController < ApplicationController

  get '/login' do
    erb :login
  end

  post '/login' do 
  
    @user =User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      puts session
      flash[:message] ="Welcome, #{@user.name}!"
     redirect "users/#{@user.id}"

    else 
     
      flash[:error] ="Your credentials were invalid. Please signup or try again."
      redirect '/login'
    end 

  end 
   
  get '/signup' do 
    erb :signup
  end 

  post '/users' do 
     @user = User.new(params)
    if @user.save      
     #if params[:name] !="" && params[:email] != "" && params[:password] != ""
      #valid
      # @user = User.create(params)      
      session[:user_id] = @user.id 
      flash[:message] = "Welcome! Thanks for signing up, #{@user.name}!"
      redirect "/users/#{@user.id}"

    else 
      flash[:error] = "Account creation failure: #{@user.errors.full_messages.to_sentence}" 
      redirect '/signup'
    end 
  end 

  get '/users/:id' do 
    @user =User.find_by(id: params[:id])
    erb :'/users/show'
  end 

  get '/logout' do 
    flash[:message] ="You've successfully logged out of your account!"
    session.clear 
    redirect'/'
  end 
end 