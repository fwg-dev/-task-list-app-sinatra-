class ListsController < ApplicationController 

  get '/lists' do
    @lists = List.all 
     erb :'lists/index'
   end

  #CREATE
  get '/lists/new' do 
      erb :"/lists/new"
  end 
   
  post '/lists' do 
    redirect_if_not_logged_in

    if params[:title] != ""
      @list = List.create(title: params[:title], user_id: current_user.id, description: params[:description], due_date: params[:due_date])
      flash[:message] = "You've created a task list successfully." if @list.id 
      redirect "/lists/#{@list.id}"
    else 
      flash[:error]= "Please provide valid input."
      redirect '/lists/new'
    end 
  end 
  
  #READ
  get '/lists/:id' do 
    set_list 
    erb :'/lists/show'
  end 
    
  get '/lists/:id/edit' do
    set_list
    redirect_if_not_logged_in
    if authorized_to_edit?(@list)
      erb :'/lists/edit'
    else 
       redirect "/users/#{current_user.id}"
    end 
  end

  #UPDATE
  patch '/lists/:id' do
    redirect_if_not_logged_in
    set_list 
    if @list.user == current_user && params[:title] && params[:description] && params[:due_date] != ""
      @list.update(title: params[:title], description: params[:description], due_date: params[:due_date])
      flash[:message] = "You've updated the task successfully"
       redirect "/lists/#{@list.id}" 

    else 
      flash[:error] ="Field cannot be empty. Please provide valid input"
      redirect "/lists/#{@list.id}/edit"
   end  
  end

  #DELETE 
  delete '/lists/:id' do 
    flash[:message] = "You've deleted the task successfully"
    set_list
    if authorized_to_edit?(@list) 
      @list.destroy
      redirect '/lists'
    else 
      redirect '/lists'
    end 
  end 


  private 

  def set_list 
    @list = List.find(params[:id])
  end 
  
end 
