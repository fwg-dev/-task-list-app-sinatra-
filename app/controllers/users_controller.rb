class UsersController < ApplicationController

  #render form
  #what routes do I need for login?
  #purpose is to render login page(form)
  get '/login' do
    "This is my login!"
    erb :login
  end
 #what routes do I need for signup?

  get '/signup' do 

  end 

end 