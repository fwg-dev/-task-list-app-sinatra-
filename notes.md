we don't write password digest in the html form because bcrypt allows us to refer to it as password instead of password_digest  

***
params is a hash. gets its key value pair from forms and dynamic bits of the url 
e.g user/id
e.g {"email"=>"shiru", "password"=>"pw"}
***

***
enable :sessions # layer of security. If someone trued to login without credentials they will not be able to 
***

***
  #undefined method "authenticate" for nil:NilClass- means that @user has a value of nil. so you have to enter valid data from seeds 
***

find_by - returns nil 

*** 

Sinatra default page- welcome page- when we load localhost: 9393- we get a new request generated from the browser that says get me nothing but / 
the request gets processed by config.ru- our environment will load. The run ApplicationController is the first controller that will get matched. It matches get '/' do erb :welcome end and it will load the generic welcome page. 
we want our user to go to the login page... so we redirect to login page... 

*********
from welcome.erb

<div class="container">
  <header><img src="images/corneal-small.png" class="img-responsive main-image"></header>
  <div class="col-md-8 col-md-offset-2">
    <h2>Sinatra Template Default Page</h2>

    <div class="content">
      <p>Welcome to the Sinatra Template! If you're seeing this page, then everything is working
      as expected. To get started, delete this file (<code>app/views/welcome.erb)</code> and begin adding
      your own actions to <code>application_controller.rb</code>. For more information, see the <a href="https://github.com/thebrianemory/corneal">README</a>.</p>
    </div>

    <div class="sidebar">
      <h3>Environment</h3>
      <ul>
        <li><b>Ruby:</b> <%= RUBY_VERSION %></li>
        <li><b>Environment:</b> <%= ENV["RACK_ENV"] %></li>
        <li><b>Server:</b> <%= @env["SERVER_SOFTWARE"] %></li>
        <li><b>Port:</b> <%= @env["SERVER_PORT"] %></li>
      </ul>
    </div>

  </div>
</div>
******
welcome.erb 
- we build links by using an anchor tab <a href>/<ahref>

******
layout.erb 
- where we build our links 

<div class ="nav"> 
      <% if logged_in? %>
    <a href="/logout">Logout</a>
    <a href="/posts">View All Tasks</a>
    <a href="/posts/new">Create List</a>
  <%  end %>
    </div>

    *****

    <h2>Create a new Entry: </h2>
list/new.erb
<form class="" action="/lists" method ="post">
  <label for="title">Title:</label>
  <input type ="text" name="title" value="">
  <input type ="submit" name="" value="Create New List">
  </form>

  ***
  raise.params.inspect - works like binding.pry 
  raises and error in runtime 
  ***
placeholders- perfect but not for edits.. text dissapears after you start typing 
****
params is subject to scope! 

***
MAJOR PROBLEMS 
you don't want anyone to edit or delete anyone's entry 
you don't want to create empty data

****
<% @lists.each do |list|%>
  <%= list.title %>
  <%= list.created_at%>
  <br></br>
  <% end %>

when we start an iteration within an erb tag, we don't want to use the display tag. we want to use the execution tag. so no <%= %> use <% %> instead 

**** 
show.erb 

if I am the current user, show edit and delete links
if I am not the current user, do not show edit and delete links 

****

//get request - we are going to render an erb becasue we need to show something 
//the other http verbs that change things on the backend, their job is to change something in the controller action and then send us on our way somewhere we will view something 

//delete, patch, and post request actions generally end in redirects... its not their job to show us anything!
//they take care of things on the back end 
//

***
<form class="" action="/list/<%= @list.id %>" method="post">
    <!-- How do I turn this form submission into a DELETE request??? -->
    <input type="hidden" name="_method" value="DELETE">
    <input type="submit" name="" value="Delete this Entry">
  </form>
*** 
options to go back to login or signup 

<a href="/">Back</a>
or 
<p>Or you can <a href="/login">log in here.</a></p>

******
// flash messages must be built in controller messages that end in redirect 
// we want when we create, update or delete something 
// survive one page request and they are "gone"
//flash is just a hash 
// we did not require sinata flash because in config/environment.erb bundler.require requires all gems to load including sinatra-flash 
// we build flash messages in post, patch or delete messages 
****

with erb - we can create instant messages that can be popoluated 

*****
According to active record- only validation I have is password-secure 
//how to add validations- add user.rb 
//validates :name, presence: true 
//validates :email, presence: true
//validates :email, uniqueness: true
--- this uses active record validations that prevenent creation, saving or updatung in the db if the requirements are not met

************
//#if params[:name] !="" && params[:email] != "" && params[:password] != ""

eliminate this line of code in user_controllers because we have validations in the user.rb models 

***********
//flash messages only work with a new http request. They only work with a redirect! 

***************
render vs redirect- what's the only way we can have access to variables 
// we only have access to instance variables when we render
// we don't have access to variables with redirect 

*************

create method--def redirect if not logged in 

****

<input type="text" name="title" placeholder="Title" value =""><br><br>
<input type="textarea" name="decription" placeholder="Description" value =""><br><br>
<input type="text" name="due date" placeholder="Due Date" value =""><br><br>
<input type ="submit" name="" value="Create New List">

***************
class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :due_date
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end

class Task < ActiveRecord::Base
  belongs_to :user 
  belongs_to :list 
end
************************
corneal model task description:string due_date:integer user_id:integer list_id:integer

****
rake db:create_migration NAME = 

rake db:create_migration NAME = AddDetailsToLists description:string due_date:integer 