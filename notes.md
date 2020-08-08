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
