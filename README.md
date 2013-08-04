Railscast sm-rc117
==================

TO clone
```
git clone "https://github.com/sweetymehta/sm-rc117.git"
```


Scaffolding (with associated object)...
```
#todo..
```
provide quick edit of associated object
```
session[:comment_ids] << id of current obect
see comments controller and post#show.html.erb
```
need of session model
```
Now with above procedure we are duplicating the code at two place
so make it at centralized location
creare user_session model with Active Record 
```
user helper methods
```
To make methods available to views
in application controller
helper_methods : method_name
```


Rails server
```
rails s
```