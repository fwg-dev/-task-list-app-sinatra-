class UsersController < ApplicationController

  #render form
  #what routes do I need for login?
  #purpose is to render login page(form)
  get '/login' do
    erb :login
  end
  #the purpose of this route is to receive  the login form 
  #find the user and log the user in (create a session) 

  post '/login' do 
    @user =User.find_by(email: params[:email])
    #find the user 
    #Authenticate the user- verify user is who they say they are. 
    #they have the credentials - email/password combo
    if  @user.authenticate(params[:password])
    #log the user in - create the user sessions
    session[:user_id] = @user.id #actually login user in 
    #redirect to user's landing page (show? index? dashboard?)
    #undefined method "authenticate" for nil:NilClass- means that @user has a value of nil. so you have to enter valid data from seeds 
     puts session
    redirect "users/#{@user.id}"

    else 
      #tell user they entered invalid credentials 
      #redirect them to the landing page (show? index? dashboard?)
      #
    end 

  end 
   #what routes do I need for signup? 
   #this route's job is to render a signup form 
  get '/signup' do 
    #erb(render) a view 

    erb :signup
  end 

  post '/users' do 
    #here is where we will create a new user and persist the new 
    #user to the DB
    #params will look like: {"name"=>"fay", "email"=>"shiru@gmail.com", "password"=>"pw"}

    #I only want to persist a user that has a name, email and password 
    if params[:name] !="" && params[:email] != "" && params[:password] != ""
      #valid
      @user = User.create(params)
      session[:user_id] = @user.id #actually login user in 

      #where do I want to send my user - log user after signup  
      #let's go to the user show page
      redirect "/users/#{@user.id}"

      # erb :'/users/show'
    else 
      #not valid 
      #will include message to user- telling what is wrong 
      redirect '/signup'
    end 
  end 

  # user show route 
  get '/users/:id' do 
    #what do I need to do first?
    @user =User.find_by(id: params[:id])
     
    erb :'/users/show'
  end 

  get '/logout' do 
    session.clear 
    redirect'/'
  end 
end 