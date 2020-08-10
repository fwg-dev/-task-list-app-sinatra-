require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # layer of security. If someone trued to login without credentials they will not be able to 
    set :session_secret, "our_task_list_app"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end 

  #helper methods for logged in user
  helpers do 
 
    #returns a boolean
    def logged_in? 
      #return true if user is logged in, otherwise false
      #current user will return nil or the entire user
      !!current_user
    end 

    def current_user
     @current_user ||= User.find_by(id:session[:user_id])
    end 

    def authorized_to_edit?(list)
      list.user == current_user
    end
    #this returns true or false if author can edit 

    #Build helper method for is redirecting if not logged in 
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] ="Must be logged in to view this page!"
        redirect '/'
      end 
    end 

    def authorized_to_edit?(list)
      list.user == current_user
    end
  end 

end
