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

show.erb -  
- 