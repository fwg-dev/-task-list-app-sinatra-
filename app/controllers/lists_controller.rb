class ListsController < ApplicationController 

 #get list/new to render a form to create new entry

 get '/lists/new' do 

  erb :"/lists/new"
 end 

 #post list to create a new list entry 

 post '/lists' do 

  #create a new journal entry and save it to db
  #I only want to save the entry if it has content 
  #I want to create a journal entry if user is logged in 

  if logged_in?
    redirect '/'
  end 
  if params[:title] != ""


  else 

  end 

end 

 #show page for a list entry 

 #index route for all list entries 

end 