class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_user_authenticated,except: [:index, :search]

  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  def search_employee
    search_key = params['search_key']
    @employees = Employee.where('lower(name) LIKE ? OR lower(description) LIKE ? OR emp_id LIKE ? OR CAST(salary AS VARCHAR(9)) LIKE ? OR CAST(age AS VARCHAR(9)) LIKE ?',search_key,search_key, search_key, search_key, search_key)
    respond_to do |format|
      format.json{ render :search}
    end
  end

  def search
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      format.json {render :create}
    end
  end

  def verify_user_authenticated
    x_auth_token = request.headers['HTTP_X_AUTH']
    unless x_auth_token == AUTH_KEY
      render json: {msg: "Unauthenticated User"}, status: 401
    end
    @verified_authentication = true
  end

  private 

  def employee_params
    params.require(:employee).permit(:emp_id, :name, :salary, :description, :age)
  end
end
