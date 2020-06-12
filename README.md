
### To show the reference that the rails cannot have the custom headers
ref: https://stackoverflow.com/questions/42013060/rails-5-how-can-a-form-submit-with-custom-http-headers

# Steps to be followed:
- First run the seed file `$ rake db:seed`
- Run the server
- go to the http://localhost:3000 for the sake of the root page
- give credentials
- login into the system
- create employees at the /employees uri
- search for employees at  the url of http://localhost:3000/search/employee


#### created apis for the 
- index listing
- create employee
- update employee
- delete employee

#### request headers are:
x-auth: "*************"