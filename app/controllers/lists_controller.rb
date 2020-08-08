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
    set_list 
    
    erb :'/lists/show'
  end 
    
  #This route should send us to list edit.erb, which would
  #render to an edit form
  get '/lists/:id/edit' do
    set_list
    if logged_in?
      if @list.user == current_user
        erb :'/lists/edit'
      else 
        redirect "/users/#{current_user.id}"
      end 
    else 
       redirect '/'
    end 
  end

  #This action's job is to 
  patch '/lists/:id' do
   #1.find list entry 
    set_list 
    if logged_in? 
      #2. modify/update the list entry 
      if @list.user == current_user
        @list.update(title: params[:title])
        #3. redirect to show page 
        redirect "/lists/#{@list.id}" 
      else 
       redirect "/users/#{current_user.id}"
      end 
    else 
      redirect '/'
   end 
  end

  #index route for all list entries 
  private 

  def set_list 
    @list = List.find(params[:id])
  end 
end 