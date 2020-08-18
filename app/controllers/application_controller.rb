require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
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

  #helper methods 
  helpers do 
 
    def logged_in? 
      !!current_user
    end 

    def current_user
     @current_user ||= User.find_by(id:session[:user_id])
    end 

    def authorized_to_edit?(list)
      list.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] ="Must be logged in to view this page!"
        redirect '/'
      end 
    end 

  end 

end
