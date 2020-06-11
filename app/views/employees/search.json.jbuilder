if @employees.count > 0
  json.employees @employees
  json.status 200
  json.msg "Successful"
else
  json.msg "Unsuccessful"
  json.status 404  
end