if @employee.id
  json.employee @employee
  json.msg "successful"
  json.status 200
else
  json.msg "Unscuccessful"
  json.status 404
end  