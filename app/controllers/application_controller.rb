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

end
