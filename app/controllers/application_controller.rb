require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # layer of security. If someone trued to login without credentials they will not be able to 
    set :session_secret, "our_task_list_app"
  end

  get "/" do
    erb :welcome
  end

  #helper methods for logged in user
  helpers do 
 
    #returns a boolean
    def logged_in? 
      #return true if user is logged in, otherwise false
      #current user will return nil or the entire user object
      !!current_user
    end 

    def current_user
     @current_user ||= User.find_by(session[:user_id])
    end 
  end 

end
