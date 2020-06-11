unless @employee.save
  json.msg "Unsuccessful"
  json.errors @employee.errors.full_messages
  json.status 201
else
  json.msg "Successful"
  json.extract!(@employee, :name, :description, :age)
  json.status 422
end
