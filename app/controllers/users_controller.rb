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
    session[:user_id] = @user.id
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

  get '/signup' do 

  end 

  # user show route 

  get '/users/:id' do 
    "this will be the user show route"
  end 

end 