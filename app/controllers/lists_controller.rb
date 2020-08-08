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

    if !logged_in?
      redirect '/'
    end 

    if params[:title] != ""
      #create a new entry 
      @list = List.create(title: params[:title], user_id: current_user.id)
      redirect "/lists/#{@list.id}"
    else 
      redirect '/lists/new'
    end 
  end 
  
  #show page for a list entry 
  get '/lists/:id' do 
    @list = List.find(params[:id])    
    erb :'/lists/show'
  end 
    
  #This route should send us to list edit.erb, which would
  #render to an edit form
  get '/lists/:id/edit' do
    erb :'/lists/edit'
  end

  #index route for all list entries 

end 