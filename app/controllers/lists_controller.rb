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

    # if !logged_in?
    #   redirect '/'
    # end 
    redirect_if_not_logged_in

    if params[:title] != ""
      #create a new entry 
      @list = List.create(title: params[:title], user_id: current_user.id, description: params[:description], due_date: params[:due_date])
      flash[:message] = "You've created a task list successfully." if @list.id #only display if it was assigned an id 
      redirect "/lists/#{@list.id}"
    else 
      flash[:error]= "Please provide valid input."
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
    redirect_if_not_logged_in
    if authorized_to_edit?(@list)
      erb :'/lists/edit'
    else 
       redirect "/users/#{current_user.id}"
    end 
  end

  #This action's job is to 
  patch '/lists/:id' do
   #1.find list entry 
    redirect_if_not_logged_in
    set_list 
      #2. modify/update the list entry 
    if @list.user == current_user && params[:title] &&  params[:description] &&  params[:due_date] != ""
      @list.update(title: params[:title], description: params[:description], due_date: params[:due_date])
      #3. redirect to show page 
      flash[:message] = "You've updated the task successfully"
       redirect "/lists/#{@list.id}" 

    else 
      flash[:error] ="Field cannot be empty. Please provide valid input"
      redirect "/lists/#{@list.id}/edit"
    end  
  end

    #index route for all list entries 
  get '/lists' do
   @lists = List.all 
    erb :'lists/index'
  end

  #delete entry 
  delete '/lists/:id' do 
    flash[:message] = "You've deleted the task successfully"
    set_list
    if authorized_to_edit?(@list)  #delete the entry #go to show page 
      @list.destroy
      redirect '/lists'
    else #if you are not allowed to manage the delete--send the user back to
      redirect '/lists'
    end 
    #go somewhere else - not deleted 
  end 

  private 

  def set_list 
    @list = List.find(params[:id])
  end 
  
end 
